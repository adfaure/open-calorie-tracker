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
import 'package:intl/intl.dart';
import 'package:open_weight/common/helpers.dart';
import 'package:open_weight/database/db_helper.dart';
import 'package:open_weight/journal/objectiveDialog.dart';
import 'package:open_weight/models/objective.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../application_localization.dart';
import 'objectiveBar.dart';

class CalorieMeter extends StatelessWidget {
  final consumedCalorie;
  final formater = NumberFormat("##.##");
  final sizeFactor = 2.0;
  final date;

  final consumedProteins;
  final lipids;
  final consumedCarbohydrates;

  CalorieMeter(
      {Key key,
      @required this.consumedCalorie,
      @required this.consumedProteins,
      @required this.lipids,
      @required this.consumedCarbohydrates,
      @required this.date})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var l = AppLocalizations.of(context);
    return Consumer2<MyDatabase, SharedPreferences>(
        builder: (builder, database, prefs, child) {
      var objModel = ObjectiveModel(
          database: database, prefs: prefs, objective: 0, date: date);
      var objModelProteins = ObjectiveModel(
          database: database,
          prefs: prefs,
          objective: 0,
          date: date,
          type: "protein");
      var objModelCarbohydrate = ObjectiveModel(
          database: database,
          prefs: prefs,
          objective: 0,
          date: date,
          type: "carbohydrate");
      return Container(
          child: Card(
            elevation: 0,
            margin: EdgeInsets.all(15),
            child: Column(children: [
              _buildProgressBar(
                  objModel, this.consumedCalorie, l.calorie, Colors.blueAccent),
              _buildProgressBar(objModelProteins, this.consumedProteins,
                  l.proteins, Colors.purple),
              _buildProgressBar(objModelCarbohydrate,
                  this.consumedCarbohydrates, l.carbohydrates, Colors.teal)
            ]),
          ),
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                  spreadRadius: 0,
                  color: Colors.white,
                  blurRadius: 1.0,
                  offset: Offset(3, 1))
            ],
          ));
    });
  }

  _buildProgressBar(
      ObjectiveModel model, int value, String title, Color colorOk) {
    return StreamBuilder(
        initialData: 0,
        stream: model.getStream(),
        builder: (context, proteinsSnapshot) {
          var objective = proteinsSnapshot.data;
          if (objective == 0) {
            return Container();
          }
          return ObjectiveBar(
            onTap: () => {setObjectiveWithDial(context, model)},
            title: title,
            objective: proteinsSnapshot.data,
            value: value,
            colorOk: colorOk,
          );
        });
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

  _buildFormula(BuildContext context, ObjectiveModel objModel, int objective) {
    var availableCalories = objective - consumedCalorie;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () => {setObjectiveWithDial(context, objModel)},
          child: _buildTextAndValue(context, formater.format(objective),
              AppLocalizations.of(context).objective),
        ),
        Text("-", textScaleFactor: sizeFactor),
        _buildTextAndValue(context, formater.format(consumedCalorie),
            AppLocalizations.of(context).consumed),
        Text("=", textScaleFactor: sizeFactor),
        _buildTextAndValue(context, formater.format(availableCalories),
            AppLocalizations.of(context).available),
      ],
    );
  }
}
