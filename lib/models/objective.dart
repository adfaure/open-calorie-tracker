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
  String type;
  StreamController<int> streamCtlr;
  final DateTime date;

  ObjectiveModel(
      {@required this.objective,
      @required this.database,
      @required this.date,
      @required this.prefs,
      this.type = "calorie"}) {
    var prefObjective = prefs.getInt("objective/$type");
    this.objective = prefObjective ?? 0;

    database.getObjective(date, type).then((obj) {
      if (obj != null) {
        this.objective = obj.objective;
        this.streamCtlr.add(obj.objective);
      }
    });

    streamCtlr = StreamController<int>.broadcast(onListen: () {
      this.changeObjective(objective);
    });
  }

  void updateSharedPrefs(int newValue) async {
    prefs.setInt("objective/$type", newValue);

    changeObjective(newValue);
    Objective obj = await database.getObjective(today(), type);

    if (obj != null) {
      database.createOrUpdateObjective(
          Objective(date: today(), objective: newValue, type: type));
    }
  }

  void changeObjective(int newValue) {
    this.objective = newValue;
    debugPrint("New value: $newValue");
    this.streamCtlr.add(newValue);
  }

  void addCurrentToDatabase() async {
    database.createOrUpdateObjective(
        Objective(date: this.date, objective: objective, type: type));
  }

  Future<int> getSafeObjective() async {
    var _objective;
    var dataObj = await database.getObjective(date, type);

    if (dataObj == null) {
      debugPrint("Get obj: objective/$type");
      _objective = prefs.getInt("objective/$type") ?? 0;
    } else {
      _objective = dataObj.objective;
    }

    if (_objective != objective) changeObjective(_objective);
    return _objective;
  }

  Stream<int> getStream() {
    return streamCtlr.stream;
  }

  close() {
    streamCtlr.close();
  }
}
