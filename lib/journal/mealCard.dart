import 'package:flutter/material.dart';

//internal dependencies
import 'package:open_weight/database/db_helper.dart';
import 'package:open_weight/food/foodSelection.dart';

class MealCard extends StatefulWidget {
  MealCard({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  _MealCardState createState() => _MealCardState();
}

class _MealCardState extends State<MealCard> {
  Stream<List<Food>> foodsItem;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
            title: Container(child: Text(widget.title)),
            trailing: IconButton(
                icon: Icon(
                  Icons.add_circle,
                  color: Colors.green.shade500,
                  size: 35,
                ),
                onPressed: () {
                  _navigateAddFoodToMeal(context);
                })));
  }

  _navigateAddFoodToMeal(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectFood(title: "Select food")),
    );
  }

}
