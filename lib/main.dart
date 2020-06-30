import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
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
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Open Calories Tracker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final BgColor = Color(0xc7c7c7c7);
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
        backgroundColor: BgColor,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
            children: [_buildAvailableCalories(context)],
            padding: EdgeInsets.fromLTRB(0, 12, 0, 12)),
        // Builder is usefull to create a new context
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
              onPressed: () => _navigateAndDisplaySelection(context),
              tooltip: 'Increment',
              child: Icon(Icons
                  .add)), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }

  _buildAvailableCalories(BuildContext context) {
    var availableCalories = 1 + _calorieQuota - _dailyCalorie;
    final sizeFactor = 2.0;

    return Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 0, // soften the shadow
            spreadRadius: 0, //extend the shadow
          )
        ],
      ),
      child: Column(children: [
        SizedBox(height: 5),
        // I use a row, so the text is placed to the right of the screen
        Row(children: [
          SizedBox(width: 5),
          Text(
            "Calorie disponibles:",
            textAlign: TextAlign.right,
          )
        ]),
        // On row for the daily consumption
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildTextAndValue(context, _calorieQuota, "Objectif"),
            // _buildTextAndValue(context, "-", ""),
            Text("-", textScaleFactor: sizeFactor),
            _buildTextAndValue(context, _dailyCalorie, "Consomées"),
            Text("=", textScaleFactor: sizeFactor),
            _buildTextAndValue(context, availableCalories, "Disponibles"),
          ],
        ),
        SizedBox(height: 5)
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

  _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EnterWeight()),
    );
    setState(() {
      _weight = int.parse(result);
    });
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
