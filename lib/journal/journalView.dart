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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_weight/common/helpers.dart';
import 'package:open_weight/models/objective.dart';
import 'package:provider/provider.dart';
// Internal dependencies
import 'package:open_weight/common/ui.dart';
import 'package:open_weight/application_drawer.dart';
import 'package:open_weight/journal/dayCard.dart';
import 'package:open_weight/journal/calorieMeter.dart';
import 'package:open_weight/journal/mealCard.dart';
import '../database/db_helper.dart';

class JournalView extends StatefulWidget {
  final String title;

  JournalView({Key key, this.title}) : super(key: key);

  @override
  _JournalViewState createState() => _JournalViewState(today());
}

class _JournalViewState extends State<JournalView> {
  var objectiveSubcription;
  var date;
  var inDatabase;
  var objective;
  var objectiveModel;

  _JournalViewState(this.date);

  @override
  void initState() {
    this.objective = 0;

    // Finaly, if the date has a record of objective for this date, we use this one in priority
    var objModel = Provider.of<ObjectiveModel>(context, listen: false);
    objModel.changeDate(this.date);

    this.objective = objModel.getObjective();
    this.objectiveSubcription = objModel.getStream().listen(_listenObjective);

    super.initState();
  }

  // const JournalView({Key key, this.allDailyFood}) : super(key: key);

  // var database = Provider.of<MyDatabase>(context, listen: false);
  // List<ConsumedFoodsWitFood> totalFood =
  //     await database.getTotalDailyCalories(today());

  // var total = totalFood.fold(
  //     0,
  //     (previousValue, element) =>
  //         previousValue + element.consumedCalories());
  // debugPrint("total: $total");
  @override
  Widget build(BuildContext build) {
    return Scaffold(
        backgroundColor: appBgColor,
        appBar: AppBar(
          title: Text("Journal"),
        ),
        drawer: ApplicationDrawer(),
        body: Consumer<MyDatabase>(builder: (builder, database, child) {
          /// StreamBuilder to handle the date selection.
          return StreamBuilder(
              stream: database.watchTotalDailyCalorie(this.date),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                var totalCalorie = snapshot.data;
                if (totalCalorie == null) {
                  totalCalorie = 0;
                }
                return Column(children: <Widget>[
                  Material(
                      elevation: 10,
                      shadowColor: Colors.black,
                      child: Column(children: <Widget>[
                        DayCard(
                          date: this.date,
                          onTapMiddle: () => _selectDate(context, database),
                          onTapNext: () async {
                            var _nextDay = nextDay(this.date);
                            _changeDate(_nextDay, database);
                          },
                          onTapPrevious: () async {
                            var _previousDay = previousDay(this.date);
                            _changeDate(_previousDay, database);
                          },
                        ),
                        Divider(
                          color: Colors.grey.shade700,
                          height: 1,
                        ),
                        CalorieMeter(
                          consumedCalorie: totalCalorie,
                          date: this.date,
                          objective: this.objective,
                        ),
                        Divider(
                          color: Colors.grey.shade50,
                          height: 1,
                        ),
                      ])),
                  Expanded(
                      child: Material(
                          elevation: 5,
                          color: appBgColor,
                          child: ListView(
                              shrinkWrap: true,
                              children: [
                                MealCard(title: "Breakfast", date: this.date),
                                MealCard(title: "Lunch", date: this.date),
                                MealCard(title: "Diner", date: this.date),
                                MealCard(title: "Snacks", date: this.date)
                              ],
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 8)))),
                ]);
              });
        }));
  }

  @override
  void dispose() {
    if (this.objectiveSubcription != null) {
      this.objectiveSubcription.cancel();
    }
    super.dispose();
  }

  _listenObjective(value) async {
    if (value != null) {
      this.setState(() {
        objective = value;
      });
    }
  }

  _changeDate(DateTime newDate, MyDatabase database) async {
    var objectiveModel = Provider.of<ObjectiveModel>(context, listen: false);
    objectiveModel.changeDate(newDate);
    this.setState(() {
      this.date = newDate;
    });
  }

  _selectDate(BuildContext context, MyDatabase database) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: this.date,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != this.date) _changeDate(picked, database);
  }
}
