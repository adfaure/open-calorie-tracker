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
  // Arbitrary date in the past.
  final january2010 = DateTime(2020, 1, 1);

  JournalView({Key key, this.title}) : super(key: key);

  @override
  _JournalViewState createState() => _JournalViewState();
}

class _JournalViewState extends State<JournalView> {
  var objectiveSubcription;
  var objectiveModel;
  var objective;
  var dateIndex;
  PageController _pageController;

  _JournalViewState();

  @override
  void initState() {
    this.objective = 0;

    var idx = today().difference(widget.january2010).inDays + 1;
    widget.january2010.add(Duration(days: idx));

    // Finaly, if the date has a record of objective for this date, we use this one in priority
    var objModel = Provider.of<ObjectiveModel>(context, listen: false);

    this.objective = objModel.getObjective();
    this.objectiveSubcription = objModel.getStream().listen(_listenObjective);

    this.dateIndex = idx;
    _pageController = PageController(initialPage: this.dateIndex, keepPage: true, viewportFraction: 0.96);
    super.initState();
  }

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
          return PageView.builder(
              controller: _pageController,
              onPageChanged: (newIdx) {
                this.setState(() {
                  this.dateIndex = newIdx;
                });
              }, 
              itemBuilder: (context, itemIndex) {
                debugPrint("item: $itemIndex");
                var newDate =
                    widget.january2010.add(Duration(days: this.dateIndex));
                return JournalPage(
                    key: Key(newDate.toString()),
                    objective: this.objective,
                    date: newDate,
                    dateCallback: _changeDate);
              });
          // key: new ValueKey(this.date));
        }));
  }

  @override
  void dispose() {
    if (this.objectiveSubcription != null) {
      this.objectiveSubcription.cancel();
    }
    this.objectiveSubcription = null;
    this.objectiveModel = null;
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

    var newIdx = newDate.difference(widget.january2010).inDays + 1;
    this._pageController.animateToPage(newIdx,
        curve: Curves.ease, duration: Duration(seconds: 1));
  }
}

class JournalPage extends StatelessWidget {
  final DateTime date;
  final int objective;
  var dateCallback;

  JournalPage(
      {Key key,
      @required this.date,
      @required this.objective,
      this.dateCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MyDatabase>(builder: (context, database, child) {
      return StreamBuilder(
          stream: database.watchTotalDailyCalorie(date),
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
                      color: Colors.grey.shade700,
                      height: 1,
                    ),
                    CalorieMeter(
                      consumedCalorie: totalCalorie,
                      date: date,
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
                            MealCard(title: "Breakfast", date: date),
                            MealCard(title: "Lunch", date: date),
                            MealCard(title: "Diner", date: date),
                            MealCard(title: "Snacks", date: date)
                          ],
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 8)))),
            ]);
          });
    });
  }

  _selectDate(BuildContext context, MyDatabase database, DateTime date) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: today(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != date) dateCallback(picked, database);
  }
}
