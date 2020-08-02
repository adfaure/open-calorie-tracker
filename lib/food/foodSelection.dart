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

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moor/moor.dart' hide Column;
import 'package:open_weight/food/createFood.dart';
import 'package:open_weight/food/foodCard.dart';
import 'package:open_weight/food/openfoodfacts.dart';
import 'package:open_weight/models/objective.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import '../database/db_helper.dart';

/// This widget should be called when one wishes to select a food, and a portion of it.
/// However, it is very similar (not to say copied-pasted) from [food.dart].
/// TODO: find a way to remove this duplication.
class SelectFood extends StatelessWidget {
  SelectFood(
      {Key key,
      @required this.title,
      this.foodsItem,
      @required this.mealType,
      @required this.date})
      : super(key: key);

  final Stream<List<FoodModel>> foodsItem;
  final String title;
  final String mealType;
  final DateTime date;
  final bgColor = Color(0xFFe3e3e3);
  final _dialogKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext build) {
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          title: Text(title),
          actions: <Widget>[
            IconButton(
              icon:  FaIcon(FontAwesomeIcons.barcode),
              onPressed: () async {
                scanAndAddProduct(build);
              },
            )
          ],
        ),
        body: Consumer<MyDatabase>(builder: (builder, database, child) {
          return StreamBuilder(
              stream: database.watchEntriesInFoods(),
              initialData: List<FoodModel>(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<FoodModel>> snapshot) {
                return ListView.builder(
                  // When the widget is first initialize, the data is null.
                  // Tertiary operators prevent getting an error (It might be seen as a workaround, idk yet)
                  itemCount: snapshot.data.length ?? 0,
                  itemBuilder: (_, index) {
                    // Passing by a builder so one can display a snackbar after the dialog ended.
                    return GestureDetector(
                        onTap: () => {
                              _getNumberOfPortion(context, snapshot.data[index])
                            },
                        child: FoodCard(
                          food: snapshot.data[index],
                        ));
                  },
                );
              });
        }),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
              onPressed: () => _navigateAndDisplaySelection(context),
              tooltip: 'Increment',
              child: Icon(Icons
                  .add)), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateFoodForm()),
    );
  }

  /// Show dialog asking for the number of portion to add from selected food.
  _getNumberOfPortion(BuildContext context, FoodModel selectedFood) async {
    // Portion controller
    final numberOfPortionCtrl = TextEditingController();

    await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Center(
                child: Column(children: [
              Text(
                'Quantity: ${selectedFood.name}',
              ),
              Text(
                '(Unit: ' + "${selectedFood.unit})",
                textAlign: TextAlign.left,
                textScaleFactor: 0.7,
              )
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
                        controller: numberOfPortionCtrl,
                        decoration: InputDecoration(
                          hintText: "80",
                        ),
                        validator: (value) {
                          var doubleString =
                              numberOfPortionCtrl.text.replaceAll(",", ".");
                          var quantity;
                          try {
                            quantity = int.parse(doubleString);
                          } catch (e) {
                            return "Unvalid quantity.";
                          }
                          if (quantity <= 0) {
                            return "Require positive number.";
                          }
                          return null;
                        },
                        onFieldSubmitted: (newValue) {
                          if (_dialogKey.currentState.validate()) {
                            var doubleString =
                                numberOfPortionCtrl.text.replaceAll(",", ".");
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
        }).then((quantity) async {
      if (quantity != null) {
        var database = Provider.of<MyDatabase>(context, listen: false);
        database.addConsumedFood(ConsumedFoodsCompanion.insert(
            calorie: selectedFood.calorie,
            name: selectedFood.name,
            portion: selectedFood.portion,
            unit: selectedFood.unit,
            quantity: quantity,
            mealType: title,
            date: this.date));

        Navigator.of(context).pop();
        var objModel = Provider.of<ObjectiveModel>(context, listen: false);
        objModel.addCurrentToDatabase();
      }
    });
  }
}
