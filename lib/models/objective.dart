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
  DateTime date;
  int objective;
  SharedPreferences prefs;
  bool inDb;
  StreamSubscription sub;

  ObjectiveModel(
      {@required this.objective,
      @required this.date,
      @required this.database,
      @required this.prefs}) {
    var prefObjective = prefs.getInt("objective");
    if (prefObjective != null) {
      this.objective = prefObjective;
    }
    streamCtlr.add(objective);
  }

  StreamController<int> streamCtlr = StreamController<int>.broadcast();

  void updateSharedPrefs(int newValue) async {
    prefs.setInt("objective", newValue);
    changeObjective(newValue);

    Objective obj = await database.getObjective(date);
    if (obj != null)
      database
          .createOrUpdateObjective(Objective(date: date, objective: objective));
  }

  void changeObjective(int newValue) {
    this.objective = newValue;
    this.streamCtlr.add(newValue);
  }

  void addCurrentToDatabase() async {
    Objective obj = await database.getObjective(date);
    if (obj == null)
      database
          .createOrUpdateObjective(Objective(date: date, objective: objective));
  }

  void changeDate(DateTime date) async {
    this.date = date;
    if (this.sub != null) this.sub.cancel();

    Objective obj = await database.getObjective(date);

    if (obj != null) {
      changeObjective(obj.objective);
      this.sub = database.watchObjective(date).listen((newValue) {
        changeObjective(newValue.objective);
      });
    } else {
      int intObj = prefs.getInt("objective");
      changeObjective(intObj);
    }
  }

  int getObjective() {
    return this.objective;
  }

  Stream<int> getStream() {
    return streamCtlr.stream;
  }

  close() {
    streamCtlr.close();
  }
}
