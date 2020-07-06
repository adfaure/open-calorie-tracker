import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'database/db_helper.dart';
import 'home.dart';

void main() {
  runApp(
    Provider<MyDatabase>(
      create: (context) => MyDatabase(),
      child: MyApp(),
      dispose: (context, db) => db.close(),
    ),
  );
}

void readUserProfile() async {
  final prefs = await SharedPreferences.getInstance();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OPT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Open Calories Tracker'),
    );
  }
}
