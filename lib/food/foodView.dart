import 'package:flutter/material.dart';
import 'package:open_weight/common/ui.dart';
import 'package:open_weight/database/db_helper.dart';
import 'package:open_weight/food/foodCard.dart';
import 'package:provider/provider.dart';

/// Focus on a modifiable food entry.
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