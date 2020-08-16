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
import 'package:flutter/services.dart';
import 'package:open_weight/ui/application_tabs.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'application_localization.dart';
import 'common/ui.dart';
import 'database/db_helper.dart';

// global variable, that can be accessed from anywhere
SharedPreferences sharedPrefs;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // I don't support landscape orientation
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

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
    return MaterialApp(
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context).title,
      supportedLocales: [
        const Locale('en', ''), // English, no country code
        const Locale('fr', ''), // fr, no country code
      ],
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => ApplicationTabBar(), // JournalView(),
      },
      // title: AppLocalizations.of(context).title,
      theme: ThemeData(
          primarySwatch: MaterialColor(0xFFe21c21, appColor),
          cardTheme: CardTheme(
              margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
              shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                Radius.circular(0.0),
              )))),
    );
  }
}
