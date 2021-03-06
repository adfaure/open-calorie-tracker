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
import 'package:open_weight/common/ui.dart';
import 'package:open_weight/database/db_helper.dart';
import 'package:open_weight/food/foodSelection.dart';
import 'package:provider/provider.dart';

import '../application_localization.dart';
import 'consumedFoodView.dart';

//internal dependencies

// I have the same error as this dude, is fix seems to work for me
// https://stackoverflow.com/questions/63429252/flutter-unhandled-exception-setstate-called-after-dispose-and-streambuil

class MealCard extends StatefulWidget {
  final date;
  final String title;
  final formater = new NumberFormat("##.##");

  MealCard({Key key, @required this.title, @required this.date})
      : super(key: key);

  @override
  _MealCardState createState() => _MealCardState();
}

class _MealCardState extends State<MealCard> {
  var _stream;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Card(
          elevation: 1,
          margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
          child: ListTile(
              title: Container(
                  child: Text(AppLocalizations.of(context)
                      .localizedMealtype(this.widget.title))),
              subtitle:
                  Consumer<MyDatabase>(builder: (builder, database, child) {
                return StreamBuilder(
                    stream: database.watchTotalDailyCalorieMeal(
                        this.widget.date, this.widget.title),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      var _totalCalorie = 0;
                      if (snapshot.data != null) {
                        // Total calorie meal
                        _totalCalorie = snapshot.data;
                      }
                      return Text(AppLocalizations.of(context).totalKcal(
                          this.widget.formater.format(_totalCalorie)));
                    });
              }),
              trailing: IconButton(
                  icon: Icon(
                    Icons.add_circle,
                    color: redTheme,
                    size: 35,
                  ),
                  onPressed: () {
                    _navigateAddFoodToMeal(context);
                  }))),
      Divider(
        height: 1,
      ),
      StreamBuilder(
          initialData: List<ConsumedFood>(),
          stream: _stream,
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
                return Dismissible(
                    confirmDismiss: (direction) {
                      return _getConfirm(context);
                    },
                    background: Container(color: Colors.red.shade100),
                    key: Key(snapshot.data[index].id.toString()),
                    onDismissed: (direction) {
                      Provider.of<MyDatabase>(context, listen: false)
                          .deleteConsumedFood(snapshot.data[index]);
                    },
                    child: _buildListTile(context, snapshot.data[index]));
              },
            );
          }),
    ]);
  }

  _buildListTile(BuildContext context, data) {
    return Material(
        color: Colors.white,
        child: InkWell(
            onLongPress: () {
              _editConsumedFood(context, data);
            },
            child: Container(
                child: ListTile(
              dense: true,
              title: Text(data.name),
              trailing: Text(
                  this.widget.formater.format(consumedCalories(data)) +
                      " kcal"),
              subtitle: Text("${data.quantity.toString()} g"),
            ))));
  }

  _navigateAddFoodToMeal(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SelectFood(
              title: this.widget.title,
              mealType: this.widget.title,
              date: this.widget.date)),
    );
  }

  _editConsumedFood(BuildContext context, ConsumedFood food) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ConsumedFoodView(
                food: food,
              )),
    );
  }

  _getConfirm(BuildContext context) {
    // Portion controller
    return showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Center(
                child:
                    Text(AppLocalizations.of(context).thisFoodWillBeDeleted)),
            children: <Widget>[
              Row(children: [
                Expanded(
                    child: FlatButton(
                  child: Text(AppLocalizations.of(context).cancel,
                      style: TextStyle(color: Colors.red)),
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                )),
                Expanded(
                    child: FlatButton(
                  child: Text(
                    AppLocalizations.of(context).continueWord,
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                )),
              ]),
            ],
          );
        });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _stream = Provider.of<MyDatabase>(context)
        .watchEntriesInDailyFoods(this.widget.date, this.widget.title);
  }
}
