import 'package:flutter/material.dart';

class CalorieMeter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // The calories it has to eat per day
    int _calorieQuota = 0;

    // The calories eaten today
    int _dailyCalorie = 0;

    var availableCalories = 1 + _calorieQuota - _dailyCalorie;
    final sizeFactor = 2.0;

    return Card(
      margin: EdgeInsets.all(0),
      child: Column(children: [
        SizedBox(height: 15),
        // I use a row, so the text is placed to the right of the screen
        Row(children: [
          SizedBox(width: 5),
          Text(
            "Available calories:",
            textAlign: TextAlign.right,
          )
        ]),
        SizedBox(height: 15),
        // On row for the daily consumption
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildTextAndValue(context, _calorieQuota, "Objective"),
            Text("-", textScaleFactor: sizeFactor),
            _buildTextAndValue(context, _dailyCalorie, "Consumed"),
            Text("=", textScaleFactor: sizeFactor),
            _buildTextAndValue(context, availableCalories, "Available"),
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
