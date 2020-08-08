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
import 'package:open_weight/common/dropdownFormField.dart';
import 'package:open_weight/common/ui.dart';
import 'package:open_weight/database/db_helper.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

/// Focus on a modifiable food entry.
class ConsumedFoodView extends StatelessWidget {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final ConsumedFood food;
  final _formKey = GlobalKey<FormState>();

  final Map<String, TextEditingController> controllers = Map();

  ConsumedFoodView({@required this.food}) {
    var json = this.food.toJson();
    debugPrint(json.toString());
    json.forEach((k, value) {
      debugPrint("init: $k, $value");
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
    return ConsumedFoodsCompanion.insert(
      name: controllers["name"].text,
      portion: int.parse(controllers["portion"].text),
      unit: controllers["unit"].text,
      calorie: int.parse(controllers["calorie"].text),
      id: Value<int>(this.food.id),
      date: DateTime.fromMillisecondsSinceEpoch(
          int.parse(controllers["date"].text)),
      mealType: controllers["mealType"].text,
      quantity: int.parse(controllers["quantity"].text),
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
                    database.upsertConsumedFood(_getFormFood());
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
                      _buildEditableRow("Name", "name",
                          validator: _requiredTextField),
                      _buildRow("Date", formatter.format(this.food.date)),
                      _buildEditableRow("Quantity", "quantity",
                          validator: _intValidator),
                      _buildDropdownRow(
                          "Meal type",
                          "mealType",
                          List<String>.from(
                              [ "Breackfast", "Lunch", "Diner", "Snacks" ])),
                      //_buildEditableRow("Meal Type", "mealType",
                      //   validator: _mealValidator),
                      _buildEditableRow("Portion", "portion"),
                      _buildEditableRow("Calorie per Portion", "calorie"),
                      _buildEditableRow("Unit", "unit"),
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

  _buildEditableDate(String name, String controllerName,
      {FormFieldValidator<String> validator}) {
    var controller = this.controllers[controllerName];

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

  _buildDropdownRow(String name, String controllerName, List<String> items) {
    var menuItems = items
        .map((e) => DropdownMenuItem<String>(
              child: Text(e),
              value: e,
            ))
        .toList();
    var controller = this.controllers[controllerName];
    debugPrint("$name: ${controller.text}");
    return Card(
      elevation: 1,
      child: Padding(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              Expanded(child: Container()),
              Expanded(
                  child: DropdownFormField<String>(
                hint: Text(
                  controller.text,
                  textAlign: TextAlign.right,
                ),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                ),
                controller: controller,
                items: menuItems,
              ))
            ],
          )),
    );
  }

  String _intValidator(String value) {
    debugPrint("intval : $value");
    return int.tryParse(value) != null ? null : "Must be an integer number.";
  }

  String _dateValidator(String value) {
    debugPrint("intval : $value");
    return int.tryParse(value) != null ? null : "Must be an integer number.";
  }

  String _requiredTextField(String value) {
    if (value.isEmpty) {
      return 'This field is required.';
    }
    return null;
  }

  String _mealValidator(String value) {
    if (value.isEmpty) {
      return 'This field is required.';
    }
    return null;
  }
}
