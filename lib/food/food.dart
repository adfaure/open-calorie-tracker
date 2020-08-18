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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_weight/common/ui.dart';
import 'package:open_weight/food/createFood.dart';
import 'package:open_weight/food/list_food.dart';
import 'package:open_weight/food/openfoodfacts.dart';
import 'package:open_weight/food/search_food.dart';

import '../application_localization.dart';
import '../database/db_helper.dart';

// TODO: rename
class ListFood extends StatelessWidget {
  ListFood({Key key, @required this.title, this.foodsItem}) : super(key: key);
  final String title;
  final bgColor = Color(0xFFe3e3e3);
  final Stream<List<FoodModel>> foodsItem;

  @override
  Widget build(BuildContext build) {
    return DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: Scaffold(
            backgroundColor: bgColor,
            appBar: AppBar(
              title: Text(AppLocalizations.of(build).foodListTitle),
              bottom: TabBar(
                indicatorColor: Colors.pink.shade200,
                indicatorWeight: 5,
                labelColor: Colors.pinkAccent.shade50,
                tabs: [
                  Tab(icon: Icon(FontAwesomeIcons.carrot)),
                  Tab(icon: Icon(FontAwesomeIcons.book)),
                  // Tab(icon: Icon(Icons.pie_chart_outlined)),
                ],
              ),
              actions: <Widget>[
                Builder(builder: (_context) {
                  return IconButton(
                    icon: FaIcon(FontAwesomeIcons.barcode),
                    onPressed: () async {
                      scanAndAddProduct(_context);
                    },
                  );
                })
              ],
            ),
            body: Container(
                color: appBgColor,
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [FoodList(), SearchFood()],
                )),
            floatingActionButton: Builder(
              builder: (context) => FloatingActionButton(
                  onPressed: () => _navigateAndDisplaySelection(context),
                  child: Icon(Icons
                      .add)), // This trailing comma makes auto-formatting nicer for build methods.
            )));
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateFoodForm()),
    );
  }
}
