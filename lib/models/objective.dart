import 'dart:async';

import 'package:flutter/material.dart';
import 'package:open_weight/database/db_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

/* StreamController<ObjectiveModel> getStreamOfObjectiveModel() {
  return StreamController<ObjectiveModel>.broadcast();
} */

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
