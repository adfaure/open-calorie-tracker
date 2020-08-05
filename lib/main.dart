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

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:open_weight/common/helpers.dart';
import 'package:open_weight/common/ui.dart';
import 'package:open_weight/models/objective.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:open_weight/journal/journalView.dart';
import 'database/db_helper.dart';

// global variable, that can be accessed from anywhere
SharedPreferences sharedPrefs;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = MyDatabase();
  sharedPrefs = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        Provider<MyDatabase>(
            create: (context) => database,
            dispose: (context, db) => db.close()),
        Provider<SharedPreferences>(create: (context) => sharedPrefs)
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<int, Color> color = {
      50: Color.fromRGBO(226, 28, 33, .1),
      100: Color.fromRGBO(226, 28, 33, .2),
      200: Color.fromRGBO(226, 28, 33, .3),
      300: Color.fromRGBO(226, 28, 33, .4),
      400: Color.fromRGBO(226, 28, 33, .5),
      500: Color.fromRGBO(226, 28, 33, .6),
      600: Color.fromRGBO(226, 28, 33, .7),
      700: Color.fromRGBO(226, 28, 33, .8),
      800: Color.fromRGBO(226, 28, 33, .9),
      900: Color.fromRGBO(226, 28, 33, 1),
    };
    return MaterialApp(
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => JournalView(),
      },
      title: 'OPT',
      theme: ThemeData(
          primarySwatch: MaterialColor(0xFFe21c21, color),
          cardTheme: CardTheme(
              margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
              shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                Radius.circular(0.0),
              )))),
    );
  }
}
