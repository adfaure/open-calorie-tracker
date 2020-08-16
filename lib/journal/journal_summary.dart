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
import 'package:open_weight/common/ui.dart';
import 'package:open_weight/food/gpl_chart.dart';
import 'package:provider/provider.dart';
// Internal dependencies
import 'package:open_weight/journal/dayCard.dart';
import '../database/db_helper.dart';
import 'calorieMeter.dart';

class JournalSummary extends StatefulWidget {
  final DateTime date;
  final dateCallback;

  JournalSummary({Key key, @required this.date, this.dateCallback})
      : super(key: key);

  @override
  _JournalSummaryState createState() => _JournalSummaryState();
}

class _JournalSummaryState extends State<JournalSummary> {
  DateTime date;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.date = this.widget.date;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MyDatabase>(builder: (context, database, child) {
      return StreamBuilder(
          stream: database.watchTotalCalorieAndDailyNutriments(date),
          initialData: List<int>.from([0, 0, 0, 0]),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            var totalCalories = snapshot.data[0];
            var totalProteins = snapshot.data[1];
            var totalCarbohyprates = snapshot.data[2];
            var totalLipids = snapshot.data[3];

            return ListView(children: <Widget>[
              Material(
                  elevation: 0,
                  color: appBgColor,
                  shadowColor: Colors.black,
                  child: Column(children: <Widget>[
                    DayCard(
                      date: date,
                      onTapMiddle: () => _selectDate(context, database, date),
                    ),
                    Divider(
                      color: appBgColor,
                      height: 5,
                    ),
                    Card(
                        elevation: 0,
                        child: StreamBuilder(
                            initialData: List<int>.from([1, 1, 1]),
                            stream: database.watchTotalDailyNutriments(date),
                            builder: (BuildContext context,
                                AsyncSnapshot<List<int>> nutrientSnapshot) {
                              return Container(
                                  // elevation: 0,
                                  color: Colors.white,
                                  padding: EdgeInsets.all(15),
                                  child: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height: 200,
                                      child: GPLChart(
                                        context: context,
                                        proteins: totalProteins,
                                        carbohydrates: totalCarbohyprates,
                                        lipids: totalLipids,
                                      )));
                            })),
                  ])),
            ]);
          });
    });
  }

  _selectDate(BuildContext context, MyDatabase database, DateTime date) async {
    final DateTime picked = await showDatePicker(
        context: context,
        currentDate: today(),
        initialDate: this.date,
        firstDate: DateTime(2015),
        lastDate: DateTime(2100));
    if (picked != null && picked != date)
      this.setState(() {
        this.date = picked;
      });
  }
}
