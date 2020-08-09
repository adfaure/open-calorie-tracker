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
import 'package:moor/moor.dart';
import 'package:open_weight/common/ui.dart';
import 'package:open_weight/database/db_helper.dart';
import 'package:provider/provider.dart';

import '../application_localization.dart';

/// Focus on a modifiable food entry.
class FoodView extends StatelessWidget {
  final FoodModel food;
  final _formKey = GlobalKey<FormState>();

  final Map<String, TextEditingController> controllers = Map();

  FoodView({@required this.food}) {
    var json = this.food.toJson();
    json.forEach((k, value) {
      var _value = "";
      if (value != null) {
        _value = value.toString();
      }

      controllers[k] = TextEditingController(
        text: _value.toString(),
      );
    });
  }

  _getFormFood() {
    return FoodModelsCompanion.insert(
      name: controllers["name"].text,
      portion: int.parse(controllers["portion"].text),
      unit: controllers["unit"].text,
      calorie: int.parse(controllers["calorie"].text),
      id: Value<int>(this.food.id),
      serving: Value<int>(int.tryParse(controllers["serving"].text)),
      source: Value<String>(this.food.source),
      barcode: Value<String>(controllers["barcode"].text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appBgColor,
        appBar: AppBar(
          title: Text(food.name),
          actions: <Widget>[
            Consumer<MyDatabase>(builder: (context, database, child) {
              return IconButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    debugPrint(_getFormFood().toString());
                    database.upsertFoodModel(_getFormFood());
                    Navigator.pop(context);
                  }
                },
                icon: Icon(Icons.save),
              );
            })
          ],
        ),
        body: Consumer<MyDatabase>(builder: (builder, database, child) {
          return Form(
              key: _formKey,
              autovalidate: true,
              child: Container(
                  color: Colors.white,
                  child: ListView(
                    children: <Widget>[
                      _buildEditableRow(
                          AppLocalizations.of(context).name, "name",
                          validator: _requiredTextField),
                      _buildEditableRow(
                          AppLocalizations.of(context).calorie, "calorie",
                          validator: _requiredTextField),
                      _buildEditableRow(
                          AppLocalizations.of(context).portion, "portion",
                          validator: _intValidator),
                      _buildEditableRow(
                          AppLocalizations.of(context).unit, "unit",
                          validator: _requiredTextField),
                      _buildEditableRow(
                          AppLocalizations.of(context).unit, "serving"),
                      _buildEditableRow(
                          AppLocalizations.of(context).servingUnit,
                          "servingUnit"),
                      _buildRow(AppLocalizations.of(context).source,
                          this.food.source),
                      _buildRow(AppLocalizations.of(context).barcode,
                          this.food.barcode),
                    ],
                  )));
        }));
  }

  _buildRow(String name, String value) {
    var _value = "";
    if (value != null) {
      _value = value.toString();
    }
    return Card(
      elevation: 1,
      child: Padding(
          padding: EdgeInsets.fromLTRB(15, 15, 30, 15),
          child: Row(
            children: <Widget>[
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                "$_value",
                textAlign: TextAlign.right,
              ))
            ],
          )),
    );
  }

  _buildEditableRow(String name, String controllerName,
      {FormFieldValidator<String> validator}) {
    var controller = this.controllers[controllerName];
    debugPrint("$name: ${controller.text}");
    return Card(
      elevation: 1,
      child: Padding(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Row(
            children: <Widget>[
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: TextFormField(
                textAlign: TextAlign.right,
                validator: validator,
                decoration: InputDecoration(
                  errorStyle: TextStyle(),
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                ),
                controller: controller,
              ))
            ],
          )),
    );
  }

  //TODO: Localize these values, but I need to find out if I realy need to bring the context till here.
  String _intValidator(String value) {
    debugPrint("intval : $value");
    return int.tryParse(value) != null ? null : "Must be an integer number.";
  }

  String _requiredTextField(String value) {
    if (value.isEmpty) {
      return 'This field is required.';
    }
    return null;
  }
}
