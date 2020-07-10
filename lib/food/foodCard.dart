import 'package:flutter/material.dart';


class FoodCard extends StatelessWidget {
  final food;
  final actionButton;
  FoodCard({Key key, @required this.food, this.actionButton}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          leading: CircleAvatar(
            child: Text('${food.name[0]}'),
            radius: 20,
          ),
          title: Text(food.name),
          subtitle:
              Text("Calories. ${food.calorie} (${food.portion}${food.unit})"),
          trailing: actionButton),
    );
  }
}