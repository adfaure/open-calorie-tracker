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

import 'package:flutter/material.dart';
import 'package:open_weight/common/helpers.dart';
import 'package:open_weight/database/db_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

/* StreamController<ObjectiveModel> getStreamOfObjectiveModel() {
  return StreamController<ObjectiveModel>.broadcast();
} */

///
/// The purpose of this class is to provide a common way to access to the objective that the application should display.
/// The rules are:
/// 1. If an objective is already recorded into the database for the selected day, it should be the one displayed.
/// 2. If no objective is in the database for the current day, we give the objective stored into the shared preferences.
/// 3. The [streamCtlr] always gives the "good" objective to use. So only one subscription is required.
/// 4. In case of modification by the user,
///    if an objective entry exists for the current day into the database, it should be modified.
///    The shared preferences entry is also updated.
/// 5. If the current date has no objective entry, only the user prefs is updated.
class ObjectiveModel {
  MyDatabase database;
  int objective;
  SharedPreferences prefs;
  bool inDb;
  StreamSubscription sub;

  final DateTime date;

  ObjectiveModel(
      {@required this.objective,
      @required this.database,
      @required this.date,
      @required this.prefs}) {
    var prefObjective = prefs.getInt("objective");
    this.objective = prefObjective ?? 0;

    debugPrint("date model: $date");
    database.getObjective(date).then((obj) {
      if (obj != null) {
        debugPrint("Get obj for date: ${obj.date}");
        this.objective = obj.objective;
        this.streamCtlr.add(obj.objective);
      }
    });

    streamCtlr.add(objective);
  }

  StreamController<int> streamCtlr = StreamController<int>.broadcast();

  void updateSharedPrefs(int newValue) async {
    prefs.setInt("objective", newValue);
    changeObjective(newValue);
    var test = today();
    Objective obj = await database.getObjective(test);
    debugPrint("$obj -> ${test}");
    if (obj != null) {
      debugPrint("already in basu $obj");
      database.createOrUpdateObjective(
          Objective(date: today(), objective: newValue));
    }
  }

  void changeObjective(int newValue) {
    this.objective = newValue;
    this.streamCtlr.add(newValue);
  }

  void addCurrentToDatabase() async {
    database.createOrUpdateObjective(
        Objective(date: this.date, objective: objective));
  }

  int getObjective() {
    return objective;
  }

  Stream<int> getStream() {
    return streamCtlr.stream;
  }

  close() {
    streamCtlr.close();
  }
}
