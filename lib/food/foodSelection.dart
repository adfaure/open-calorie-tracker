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
import 'package:open_weight/food/search_food.dart';
import 'package:open_weight/models/objective.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../application_localization.dart';
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
            title:
                Text(AppLocalizations.of(build).localizedMealtype(this.title))),
        body: SearchFood(onTapFoodCard: (food) {
          _getNumberOfPortion(build, food);
        }),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
              onPressed: () => _navigateAndDisplaySelection(context),
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
                  '${AppLocalizations.of(context).add}:??${selectedFood.name}',
                ),
                Text(
                  '(${AppLocalizations.of(context).unit}: ' +
                      "${selectedFood.unit})",
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
                                var doubleString = numberOfPortionCtrl.text
                                    .replaceAll(",", ".");
                                var quantity;
                                try {
                                  quantity = int.parse(doubleString);
                                } catch (e) {
                                  return AppLocalizations.of(context)
                                      .invalidNumber;
                                }
                                if (quantity <= 0) {
                                  return AppLocalizations.of(context)
                                      .requirePositiveNumber;
                                }
                                return null;
                              },
                              onFieldSubmitted: (newValue) {
                                if (_dialogKey.currentState.validate()) {
                                  var doubleString = numberOfPortionCtrl.text
                                      .replaceAll(",", ".");
                                  Navigator.pop(
                                      context, int.parse(doubleString));
                                }
                              }))),
                  SizedBox(
                    width: 50,
                  )
                ])
              ]);
        }).then((quantity) async {
      if (quantity != null) {
        var database = Provider.of<MyDatabase>(context, listen: false);
        var prefs = Provider.of<SharedPreferences>(context, listen: false);

        database.addConsumedFood(ConsumedFoodsCompanion.insert(
          calorie: selectedFood.calorie,
          name: selectedFood.name,
          portion: selectedFood.portion,
          unit: selectedFood.unit,
          quantity: quantity,
          mealType: title,
          date: this.date,
          proteins: Value<int>(selectedFood.proteins),
          carbohydrates: Value<int>(selectedFood.carbohydrates),
          lipids: Value<int>(selectedFood.lipids),
        ));

        Navigator.of(context).pop();

        // If we register a food, we check if anyobjective are up for, for the calorie and the nutrients.
        // If it is the case, we save them in the database if it not already done, this should enable us to keep an history up to date.

        // Calorie Objective
        var objModelCalorie = ObjectiveModel(
            database: database,
            prefs: prefs,
            objective: 0,
            date: date,
            type: "calorie");
        var calObj = await objModelCalorie.getSafeObjective();
        if (calObj > 0) {
          database.createOrUpdateObjective(
              Objective(date: this.date, objective: calObj, type: "calorie"));
        }

        // Proteins Objective
        var objModelProteins = ObjectiveModel(
            database: database,
            prefs: prefs,
            objective: 0,
            date: date,
            type: "protein");
        var protObj = await objModelProteins.getSafeObjective();
        if (protObj > 0) {
          database.createOrUpdateObjective(
              Objective(date: this.date, objective: protObj, type: "protein"));
        }

        // carbohydrate Objective
        var objCarboModel = ObjectiveModel(
            database: database,
            prefs: prefs,
            objective: 0,
            date: date,
            type: "carbohydrate");
        var carboObj = await objCarboModel.getSafeObjective();
        if (carboObj > 0) {
          database.createOrUpdateObjective(Objective(
              date: this.date, objective: carboObj, type: "carbohydrate"));
        }

        // carbohydrate Objective
        var objLipidModel = ObjectiveModel(
            database: database,
            prefs: prefs,
            objective: 0,
            date: date,
            type: "lipid");
        var lipidObj = await objCarboModel.getSafeObjective();
        if (carboObj > 0) {
          database.createOrUpdateObjective(
              Objective(date: this.date, objective: lipidObj, type: "lipid"));
        }
      }
    });
  }
}
