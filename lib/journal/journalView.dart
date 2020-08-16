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
import 'package:provider/provider.dart';
// Internal dependencies
import 'package:open_weight/common/ui.dart';
import 'package:open_weight/journal/dayCard.dart';
import 'package:open_weight/journal/calorieMeter.dart';
import 'package:open_weight/journal/mealCard.dart';
import '../database/db_helper.dart';

class JournalView extends StatefulWidget {
  final String title;
  // Arbitrary date in the past.
  final january2010 = DateTime(2020, 1, 1);
  JournalView({Key key, this.title}) : super(key: key);

  @override
  _JournalViewState createState() => _JournalViewState();
}

class _JournalViewState extends State<JournalView> {
  var dateIndex;
  PageController _pageController;

  _JournalViewState();

  @override
  void initState() {
    var idx = today().difference(widget.january2010).inDays + 1;
    widget.january2010.add(Duration(days: idx));

    this.dateIndex = idx;
    _pageController = PageController(
        initialPage: this.dateIndex, keepPage: true, viewportFraction: 1);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MyDatabase>(builder: (builder, database, child) {
      /// StreamBuilder to handle the date selection.
      return PageView.builder(
          controller: _pageController,
          onPageChanged: (newIdx) async {
            this.setState(() {
              this.dateIndex = newIdx;
            });
          },
          itemBuilder: (context, itemIndex) {
            // I need to clean the date because it `add` create a new Datetime with 1, wich is not something I wish.
            var newDate = cleanDate(widget.january2010
                .add(Duration(days: this.dateIndex, hours: 0)));

            return JournalPage(
                key: Key(newDate.toString()),
                date: newDate,
                dateCallback: _changeDate);
          });
      // key: new ValueKey(this.date));
    });
  }

  _changeDate(DateTime newDate, MyDatabase database) async {
    var newIdx = newDate.difference(widget.january2010).inDays + 1;
    this._pageController.animateToPage(newIdx,
        curve: Curves.ease, duration: Duration(milliseconds: 50));
  }
}

class JournalPage extends StatelessWidget {
  final DateTime date;
  var dateCallback;

  JournalPage({Key key, @required this.date, this.dateCallback})
      : super(key: key);

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

            return Column(children: <Widget>[
              Material(
                  elevation: 1,
                  shadowColor: Colors.black,
                  child: Column(children: <Widget>[
                    DayCard(
                      date: date,
                      onTapMiddle: () => _selectDate(context, database, date),
                      onTapNext: () async {
                        var _nextDay = nextDay(date);
                        dateCallback(_nextDay, database);
                      },
                      onTapPrevious: () async {
                        var _previousDay = previousDay(date);
                        dateCallback(_previousDay, database);
                      },
                    ),
                    Divider(
                      color: Colors.grey.shade50,
                      height: 5,
                    ),
                    CalorieMeter(
                      date: date,
                      consumedCalorie: totalCalories,
                      consumedCarbohydrates: totalCarbohyprates,
                      consumedProteins: totalProteins,
                      lipids: totalLipids,
                    ),
                    Divider(
                      color: Colors.grey.shade50,
                      height: 5,
                    ),
                    Divider(
                      color: Colors.grey,
                      height: 1,
                    ),
                  ])),
              Expanded(
                  child: Material(
                      elevation: 1,
                      color: appBgColor,
                      child: ListView(
                          // shrinkWrap: true,
                          children: [
                            MealCard(title: "Breakfast", date: date),
                            MealCard(title: "Lunch", date: date),
                            MealCard(title: "Diner", date: date),
                            MealCard(title: "Snacks", date: date),
                          ], padding: EdgeInsets.fromLTRB(0, 0, 0, 8)))),
            ]);
          });
    });
  }

  _selectDate(BuildContext context, MyDatabase database, DateTime date) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: today(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2100));
    if (picked != null && picked != date) dateCallback(picked, database);
  }
}
