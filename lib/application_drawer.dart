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
import 'package:moor_db_viewer/moor_db_viewer.dart';
import 'package:open_weight/database/db_helper.dart';
import 'package:open_weight/food/openfoodfacts.dart';
import 'package:open_weight/profile.dart';
import 'package:provider/provider.dart';

import 'food/food.dart';

class ApplicationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text("Menu"),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('My Foods'),
            onTap: () {
              _navigateShowFoodPanel(context);
            },
          ),
          ListTile(
            title: Text('Your informations'),
            onTap: () {
              _navigateUserView(context);
            },
          ),
          ListTile(
            title: Text('Open Food Fact'),
            onTap: () {
              _navigateOpenFoodFactView(context);
            },
          ),
          ListTile(
            title: Text('Debug data'),
            onTap: () {
              _debugShowDatabase(context);
            },
          ),
        ],
      ),
    );
  }

  _debugShowDatabase(BuildContext context) async {
    final database = Provider.of<MyDatabase>(context, listen: false);

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MoorDbViewer(database)));
  }

  _navigateShowFoodPanel(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ListFood(
                title: "Your foods",
              )),
    );
  }

  _navigateUserView(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserView()),
    );
  }

  _navigateOpenFoodFactView(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OpenFoodFacts()),
    );
  }
}
