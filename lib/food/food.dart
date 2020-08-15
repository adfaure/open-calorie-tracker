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
import 'package:open_weight/food/createFood.dart';
import 'package:open_weight/food/foodCard.dart';
import 'package:open_weight/food/foodView.dart';
import 'package:open_weight/food/openfoodfacts.dart';
import 'package:provider/provider.dart';

import '../application_localization.dart';
import '../database/db_helper.dart';

class ListFood extends StatelessWidget {
  ListFood({Key key, @required this.title, this.foodsItem}) : super(key: key);
  final String title;
  final bgColor = Color(0xFFe3e3e3);
  final Stream<List<FoodModel>> foodsItem;

  @override
  Widget build(BuildContext build) {
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          title: Text(AppLocalizations.of(build).foodListTitle),
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
        body: Consumer<MyDatabase>(builder: (builder, database, child) {
          return StreamBuilder(
              stream: database.watchEntriesInFoods(),
              initialData: List<FoodModel>(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<FoodModel>> snapshot) {
                return ListView.builder(
                  // When the widget is first initialize, the data is null.
                  // Tertiary operators prevent getting an error (It might be seen as a workaround, idk yet)
                  itemCount: snapshot.data.length ?? 0,
                  itemBuilder: (_, index) {
                    return new GestureDetector(
                        onTap: () =>
                            {_showFoodView(context, snapshot.data[index])},
                        child: FoodCard(
                            food: snapshot.data[index],
                            actionButton: IconButton(
                              icon: Icon(Icons.delete_outline),
                              onPressed: () {
                                var entry = snapshot.data[index];
                                database.deleteFoodModel(entry);
                              },
                              color: Colors.red,
                            )));
                  },
                );
              });
        }),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
              onPressed: () => _navigateAndDisplaySelection(context),
              child: Icon(Icons
                  .add)), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }

  _showFoodView(BuildContext context, FoodModel food) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => FoodView(
                food: food,
              )),
    );
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateFoodForm()),
    );
  }
}
