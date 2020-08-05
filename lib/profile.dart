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
import 'package:open_weight/common/helpers.dart';
import 'package:open_weight/common/ui.dart';
import 'package:open_weight/database/db_helper.dart';
import 'package:open_weight/models/objective.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'journal/objectiveDialog.dart';

/// Focus on a modifiable food entry.
class UserView extends StatelessWidget {
  final scaleFactor = 1.2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appBgColor,
        appBar: AppBar(
          title: Text("Personal informations"),
        ),
        body: Consumer2<MyDatabase, SharedPreferences>(
            builder: (builder, database, prefs, child) {
          return ListView(
            children: <Widget>[_objectiveRow(context, prefs, database)],
          );
        }));
  }

  _objectiveRow(
      BuildContext context, SharedPreferences prefs, MyDatabase database) {
    var objModel = ObjectiveModel(
        database: database, prefs: prefs, objective: 0, date: today());
    return GestureDetector(
        onTap: () => {setObjectiveWithDial(context, objModel)},
        child: Card(
            child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            children: <Widget>[
              Text("Objective", 
              ),
              Expanded(
                child: Container(),
              ),
              StreamBuilder(
                  stream: objModel.getStream(),
                  initialData: objModel.getObjective(),
                  builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                    debugPrint(snapshot.toString());
                    return Text(
                      snapshot.data.toString(),
                      textScaleFactor: this.scaleFactor,
                    );
                  })
            ],
          ),
        )));
  }
}
