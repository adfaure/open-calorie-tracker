import 'package:flutter/material.dart';
import 'application_drawer.dart';
import 'food.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final bgColor = Color(0xFFe3e3e3);
  int _weight = 0;

  // The user name
  String _userName = "";

  // The calories it has to eat per day
  int _calorieQuota = 0;

  // The calories eaten today
  int _dailyCalorie = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
          children: [_buildAvailableCalories(context)],
          padding: EdgeInsets.fromLTRB(0, 12, 0, 12)),
      // Builder is usefull to create a new context
      drawer: buildDrawer(context),
    );
  }

  _buildAvailableCalories(BuildContext context) {
    var availableCalories = 1 + _calorieQuota - _dailyCalorie;
    final sizeFactor = 2.0;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.white70,
            blurRadius: 10, // soften the shadow
            spreadRadius: 1, //extend the shadow
          )
        ],
      ),
      child: Column(children: [
        SizedBox(height: 15),
        // I use a row, so the text is placed to the right of the screen
        Row(children: [
          SizedBox(width: 5),
          Text(
            "Calorie disponibles:",
            textAlign: TextAlign.right,
          )
        ]),
        SizedBox(height: 15),
        // On row for the daily consumption
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildTextAndValue(context, _calorieQuota, "Objectif"),
            Text("-", textScaleFactor: sizeFactor),
            _buildTextAndValue(context, _dailyCalorie, "Consomées"),
            Text("=", textScaleFactor: sizeFactor),
            _buildTextAndValue(context, availableCalories, "Disponibles"),
          ],
        ),
        SizedBox(height: 15)
      ]),
    );
  }

  _buildTextAndValue(BuildContext context, value, text) {
    final sizeFactor = 2.0;

    return Column(
      children: [
        Text(value.toString(), textScaleFactor: sizeFactor),
        Text(text, textScaleFactor: sizeFactor / 3),
      ],
    );
  }
}

class EnterWeight extends StatelessWidget {
  final weightFormCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Enter your current weight"),
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(60),
          child: TextField(
            autofocus: true,
            keyboardType: TextInputType.number,
            textDirection: TextDirection.ltr,
            controller: weightFormCtrl,
            onEditingComplete: () =>
                {Navigator.pop(context, weightFormCtrl.text)},
          ),
        )));
  }
}
