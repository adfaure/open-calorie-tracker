/*  This file is part of the open calorie tracker project. 
 *  This application helps you to track the consumed calories on a daily basis.
 *  Copyright (C) 2020. Adrien FAURE
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <https://www.gnu.org/licenses/>. */

import 'package:flutter/material.dart';
// Number formatting
import 'package:intl/intl.dart';
import 'package:open_weight/models/objective.dart';
import 'package:provider/provider.dart';

class CalorieMeter extends StatelessWidget {
  final consumedCalorie;
  final objective;
  final formater = NumberFormat("##.##");
  final _dialogKey = GlobalKey<FormState>();

  final date;

  CalorieMeter(
      {Key key,
      @required this.consumedCalorie,
      @required this.objective,
      @required this.date})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var availableCalories = objective - consumedCalorie;
    final sizeFactor = 2.0;

    return Container(
        child: Card(
          margin: EdgeInsets.all(0),
          child: Column(children: [
            SizedBox(height: 25),
            // I use a row, so the text is placed to the right of the screen
            Row(children: [
              SizedBox(width: 5),
              Text(
                "Available calories:",
                textAlign: TextAlign.right,
              )
            ]),
            // On row for the daily consumption
            SizedBox(
              height: 12.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => {_setObjective(context)},
                  child: _buildTextAndValue(
                      context, formater.format(objective), "Objective"),
                ),
                Text("-", textScaleFactor: sizeFactor),
                _buildTextAndValue(
                    context, formater.format(consumedCalorie), "Consumed"),
                Text("=", textScaleFactor: sizeFactor),
                _buildTextAndValue(
                    context, formater.format(availableCalories), "Available"),
              ],
            ),
            SizedBox(height: 25)
          ]),
        ),
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                spreadRadius: 1,
                color: Colors.black54,
                blurRadius: 1.0,
                offset: Offset(3, 1))
          ],
        ));
  }

  _buildTextAndValue(BuildContext context, value, text) {
    final sizeFactor = 2.0;

    return Column(
      children: [
        Text(value.toString(), textScaleFactor: sizeFactor),
        Text(text, textScaleFactor: sizeFactor / 3),
      ],
    );
  }

  /// Show dialog asking for the number of portion to add from selected food.
  _setObjective(BuildContext context) async {
    // Portion controller
    final objectiveValueCtrl = TextEditingController();

    await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Center(
                child: Column(children: [
              Text(
                'Objective',
              ),
            ])),
            children: <Widget>[
              Row(children: [
                SizedBox(
                  width: 50,
                ),
                Expanded(
                  child: Form(
                      key: _dialogKey,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        controller: objectiveValueCtrl,
                        decoration: InputDecoration(
                          hintText: "80",
                        ),
                        validator: (value) {
                          var doubleString =
                              objectiveValueCtrl.text.replaceAll(",", ".");
                          var newObjective;
                          try {
                            newObjective = int.parse(doubleString);
                          } catch (e) {
                            return "Unvalid quantity.";
                          }
                          if (newObjective <= 0) {
                            return "Require positive number.";
                          }
                          return null;
                        },
                        onFieldSubmitted: (newValue) {
                          if (_dialogKey.currentState.validate()) {
                            var doubleString =
                                objectiveValueCtrl.text.replaceAll(",", ".");
                            Navigator.pop(context, int.parse(doubleString));
                          }
                        },
                      )),
                ),
                SizedBox(
                  width: 50,
                ),
              ]),
            ],
          );
        }).then((newObjective) async {
      if (newObjective != null) {
        var objectiveModel =
            Provider.of<ObjectiveModel>(context, listen: false);
        objectiveModel.updateSharedPrefs(newObjective);
      }
    });
  }
}
