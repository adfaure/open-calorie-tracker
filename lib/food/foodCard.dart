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
import 'package:open_weight/database/db_helper.dart';

class FoodCard extends Card {
  final FoodModel food;
  final actionButton;
  FoodCard({Key key, @required this.food, this.actionButton}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          leading: CircleAvatar(
            child: Text('${food.name[0]}'),
            radius: 20,
          ),
          title: Text(food.name),
          subtitle:
              Text("kcal. ${food.calorie} (${food.portion}${food.unit})"),
          trailing: actionButton),
    );
  }
}