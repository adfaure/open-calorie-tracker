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
import 'package:moor/moor.dart' hide Column;
import 'package:open_weight/common/columnBuilder.dart';
// Number formatting
import 'package:intl/intl.dart';
import 'package:open_weight/common/helpers.dart';

//internal dependencies
import 'package:open_weight/database/db_helper.dart';
import 'package:open_weight/food/foodSelection.dart';
import 'package:provider/provider.dart';

class MealCard extends StatelessWidget {
  final date;
  final String title;
  final formater = new NumberFormat("##.##");

  MealCard({Key key, @required this.title, @required this.date})
      : super(key: key);

  var totalCalorie;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Card(
          margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
          child: ListTile(
              title: Container(child: Text(title)),
              subtitle:
                  Consumer<MyDatabase>(builder: (builder, database, child) {
                return StreamBuilder(
                    stream:
                        database.watchTotalDailyCalorieMeal(this.date, title),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      var _totalCalorie = 0;
                      if (snapshot.data != null) {
                        // Total calorie meal
                        _totalCalorie = snapshot.data;
                      }
                      return Text("Total: ${formater.format(_totalCalorie)} kcal");
                    });
              }),
              trailing: IconButton(
                  icon: Icon(
                    Icons.add_circle,
                    color: Colors.blue,
                    size: 35,
                  ),
                  onPressed: () {
                    _navigateAddFoodToMeal(context);
                  }))),
      Consumer<MyDatabase>(builder: (builder, database, child) {
        return StreamBuilder(
            initialData: List<ConsumedFood>(),
            stream: database.watchEntriesInDailyFoods(this.date, title),
            builder: (BuildContext context,
                AsyncSnapshot<List<ConsumedFood>> snapshot) {
              var count = 0;
              if (snapshot.data != null) {
                // Number of entry
                count = snapshot.data.length;
              }
              return CustomColumnBuilder(
                itemCount: count,
                itemBuilder: (_, index) {
                  // Passing by a builder so one can display a snackbar after the dialog ended.
                  return Container(
                      color: Colors.white,
                      child: ListTile(
                        dense: true,
                        title: Text(snapshot.data[index].name),
                        trailing: Text(formater.format(
                                consumedCalories(snapshot.data[index])) +
                            " kcal"),
                      ));
                },
              );
            });
      }),
    ]);
  }

  _navigateAddFoodToMeal(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              SelectFood(title: title, mealType: title, date: this.date)),
    );
  }
}
