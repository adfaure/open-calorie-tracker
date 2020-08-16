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
import 'package:open_weight/common/checkbox.dart';
import 'package:open_weight/common/helpers.dart';
import 'package:open_weight/database/db_helper.dart';
import 'package:open_weight/journal/objectiveDialog.dart';
import 'package:open_weight/models/objective.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../application_localization.dart';

/// Focus on a modifiable food entry.
class UserView extends StatelessWidget {
  final scaleFactor = 1.2;
  @override
  Widget build(BuildContext context) {
    return Consumer2<MyDatabase, SharedPreferences>(
        builder: (builder, database, prefs, child) {
      var objModel = ObjectiveModel(
          database: database, prefs: prefs, objective: 0, date: today());
      var objModelProteins = ObjectiveModel(
          database: database,
          prefs: prefs,
          objective: 0,
          date: today(),
          type: "protein");
      var objModelCarbohydrate = ObjectiveModel(
          database: database,
          prefs: prefs,
          objective: 0,
          date: today(),
          type: "carbohydrate");
      var objModelLipid = ObjectiveModel(
          database: database,
          prefs: prefs,
          objective: 0,
          date: today(),
          type: "lipid");
      return ListView(
        children: <Widget>[
          Card(
              elevation: 1,
              margin: EdgeInsets.all(0),
              color: Colors.white,
              child: Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        "${AppLocalizations.of(context).objectives}",
                        textScaleFactor: 1.5,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                    ],
                  ))),
          ObjectiveRow(objectiveModel: objModel),
          ObjectiveRow(objectiveModel: objModelProteins),
          ObjectiveRow(objectiveModel: objModelCarbohydrate),
          ObjectiveRow(objectiveModel: objModelLipid),
        ],
      );
    });
  }
}

class ObjectiveRow extends StatefulWidget {
  final ObjectiveModel objectiveModel;
  final scaleFactor = 1.2;
  ObjectiveRow(
      {Key key,
      // @required this.initialValue,
      //@required this.onChanged,
      @required this.objectiveModel})
      : super(key: key);
  var onChanged;
  bool initialValue;

  @override
  _ObjectiveRowState createState() => _ObjectiveRowState();
}

class _ObjectiveRowState extends State<ObjectiveRow> {
  bool checked;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checked = this.widget.objectiveModel.getStatus();
  }

  @override
  Widget build(BuildContext context) {
    var l = AppLocalizations.of(context);
    var text = l.calorie;

    if (this.widget.objectiveModel.type == "protein") {
      text = l.proteins;
    } else if (this.widget.objectiveModel.type == "calorie") {
      text = l.calorie;
    } else if (this.widget.objectiveModel.type == "carbohydrate") {
      text = l.carbohydrates;
    } else if (this.widget.objectiveModel.type == "lipid") {
      text = l.lipids;
    }

    return Card(
        child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(children: [
              Row(
                children: <Widget>[
                  Text(
                    "${l.objective}: $text",
                    textScaleFactor: 1.2,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  CheckBox(
                    initialValue: this.widget.objectiveModel.getStatus(),
                    onChanged: (value) {
                      if (value)
                        this.widget.objectiveModel.enableObjective();
                      else
                        this.widget.objectiveModel.disableObjective();
                      this.setState(() {
                        checked = value;
                      });
                    },
                  )
                ],
              ),
              checked
                  ? Divider(
                      color: Colors.grey,
                    )
                  : Container(),
              checked ? _getValueRow() : Container()
            ])));
  }

  _getValueRow() {
    var l = AppLocalizations.of(context);

    return GestureDetector(
        onTap: () =>
            {setObjectiveWithDial(context, this.widget.objectiveModel)},
        child: Container(
          padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
          child: Row(
            children: <Widget>[
              Text(
                "${l.value}",
                textScaleFactor: this.widget.scaleFactor,
              ),
              Expanded(child: Container()),
              StreamBuilder(
                  stream: this.widget.objectiveModel.getStream(),
                  initialData: 0,
                  builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                    return Text(
                      snapshot.data.toString(),
                      textScaleFactor: this.widget.scaleFactor,
                    );
                  })
            ],
          ),
        ));
  }
}
