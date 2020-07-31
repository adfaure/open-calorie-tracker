import 'dart:async';

import 'package:flutter/material.dart';
import 'package:open_weight/common/helpers.dart';
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
        Provider<ObjectiveModel>(
            create: (context) => ObjectiveModel(
                objective: 0,
                date: today(),
                database: database,
                prefs: sharedPrefs),
            dispose: (context, objModel) => objModel.close())
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => JournalView(),
      },
      title: 'OPT',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          cardTheme: CardTheme(
              margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
              shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                Radius.circular(0.0),
              )))),
    );
  }
}
