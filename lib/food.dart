import 'package:flutter/material.dart';



/*
  Basis food class stored in the database
 */
class Food {
  final int id;
  // Food name: apple
  final String foodName;
  // Calorie per portions
  final double caloriesPerPortion;
  // Portion size, example 100
  final double portionSize;
  // Portion's unit, example g
  final String unit;

  Food({this.id, this.foodName, this.caloriesPerPortion, this.portionSize, this.unit});
}


class CreateFood extends StatefulWidget {
  CreateFood({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CreateFoodState createState() => _CreateFoodState();
}

class _CreateFoodState extends State<CreateFood> {


  @override
  Widget build(BuildContext build) {

  }

}
