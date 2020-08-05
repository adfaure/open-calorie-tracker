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
import 'package:open_weight/common/ui.dart';
import 'package:open_weight/database/db_helper.dart';
import 'package:provider/provider.dart';

/// Focus on a modifiable food entry.
class FoodView extends StatelessWidget {
  final FoodModel food;

  FoodView({@required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appBgColor,
        appBar: AppBar(
          title: Text(food.name),
        ),
        body: Consumer<MyDatabase>(builder: (builder, database, child) {
          return Form(
              child: Container(
                  color: Colors.white,
                  child: ListView(
                    children: <Widget>[
                      _buildEditableRow("Name", this.food.name),
                      _buildEditableRow("Calorie", this.food.calorie),
                      _buildEditableRow("Portion", this.food.portion),
                      _buildEditableRow("Unit", this.food.unit),
                      _buildEditableRow("Serving", this.food.serving),
                      _buildEditableRow("Serving unit", this.food.servingUnit),
                      _buildRow("Source", this.food.source),
                      _buildRow("barcode", this.food.barcode),
                    ],
                  )));
        }));
  }

  _buildRow(name, value) {
    return Card(
      elevation: 1,
      child: Padding(
          padding: EdgeInsets.all(15),
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
                "$value",
                textAlign: TextAlign.right,
              ))
            ],
          )),
    );
  }

  _buildEditableRow(name, value) {
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
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(0),
                ),
                controller: TextEditingController(text: "$value"),
              ))
            ],
          )),
    );
  }
}
