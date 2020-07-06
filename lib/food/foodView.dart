import 'package:flutter/material.dart';
import 'package:open_weight/common/ui.dart';
import 'package:open_weight/database/db_helper.dart';
import 'package:open_weight/food/foodCard.dart';
import 'package:provider/provider.dart';

class FoodView extends StatelessWidget {
  final Food food;

  FoodView({@required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appBgColor,
        appBar: AppBar(
          title: Text(food.name),
        ),
        body: Consumer<MyDatabase>(builder: (builder, database, child) {
          return FoodCard(
            food: food,
          );
        }));
  }
}

/*
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
*/
