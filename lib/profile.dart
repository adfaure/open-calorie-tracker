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
import 'package:open_weight/models/objective.dart';
import 'package:provider/provider.dart';

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
        body: Consumer<ObjectiveModel>(builder: (builder, objModel, child) {
          return ListView(
            children: <Widget>[_objectiveRow(context, objModel)],
          );
        }));
  }

  _objectiveRow(BuildContext context, ObjectiveModel objModel) {
    // Changing the date for today's date.
    // This should prevent users to change the ojective of a oldday by accessing to this menu.
    // If the objective is change using this menu, 
    // the objective for the today (if already in the database) and in the shardePrefs is updated.
    objModel.changeDate(today());

    return GestureDetector(
        onTap: () => {setObjectiveWithDial(context)},
        child: Card(
            child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            children: <Widget>[
              Text(
                "Objective",
                textScaleFactor: this.scaleFactor,
              ),
              Expanded(
                child: Container(),
              ),
              StreamBuilder(
                  stream: objModel.getStream(),
                  initialData: objModel.getObjective(),
                  builder: (BuildContext context,  AsyncSnapshot<int> snapshot) {
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
