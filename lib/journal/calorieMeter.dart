import 'package:flutter/material.dart';
// Number formatting
import 'package:intl/intl.dart';

class CalorieMeter extends StatelessWidget {
  final consumedCalorie;
  final objective;
  final formater = NumberFormat("##.##");

  CalorieMeter(
      {Key key, @required this.consumedCalorie, @required this.objective})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var availableCalories = objective - consumedCalorie;
    final sizeFactor = 2.0;

    return Card(
      margin: EdgeInsets.all(0),
      child: Column(children: [
        SizedBox(height: 25),
        // I use a row, so the text is placed to the right of the screen
        Row(children: [
          SizedBox(width: 5),
          Text(
            "Available calories:",
            textAlign: TextAlign.right,
          )
        ]),
        // On row for the daily consumption
        SizedBox(height: 12.5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildTextAndValue(
                context, formater.format(objective), "Objective"),
            Text("-", textScaleFactor: sizeFactor),
            _buildTextAndValue(
                context, formater.format(consumedCalorie), "Consumed"),
            Text("=", textScaleFactor: sizeFactor),
            _buildTextAndValue(
                context, formater.format(availableCalories), "Available"),
          ],
        ),
        SizedBox(height: 25)
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
