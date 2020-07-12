import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moor/moor.dart' hide Column;
import 'package:open_weight/common/columnBuilder.dart';
import 'package:open_weight/common/helpers.dart';
// Number formatting
import 'package:intl/intl.dart';

//internal dependencies
import 'package:open_weight/database/db_helper.dart';
import 'package:open_weight/food/foodSelection.dart';
import 'package:provider/provider.dart';

class MealCard extends StatefulWidget {
  final date;
  final String title;
  final formater = new NumberFormat("##.##");

  MealCard({Key key, @required this.title, @required this.date})
      : super(key: key);

  @override
  _MealCardState createState() => _MealCardState();
}

class _MealCardState extends State<MealCard> {
  var totalCalorie;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Card(
          margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
          child: ListTile(
              title: Container(child: Text(widget.title)),
              subtitle:
                  Consumer<MyDatabase>(builder: (builder, database, child) {
                return StreamBuilder(
                    stream: database.watchTotalDailyCalorieMeal(
                        today(), widget.title),
                    builder:
                        (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                      var _totalCalorie = 0;
                      if (snapshot.data != null) {
                        // Total calorie meal
                        _totalCalorie = snapshot.data;
                      }
                      return Text(widget.formater.format(_totalCalorie));
                    });
              }),
              trailing: IconButton(
                  icon: Icon(
                    Icons.add_circle,
                    color: Colors.blue,
                    size: 35,
                  ),
                  onPressed: () {
                    _navigateAddFoodToMeal(context);
                  }))),
      Consumer<MyDatabase>(builder: (builder, database, child) {
        return StreamBuilder(
            initialData: List<ConsumedFoodsWitFood>(),
            stream: database.watchEntriesInDailyFoods(today(), widget.title),
            builder: (BuildContext context,
                AsyncSnapshot<List<ConsumedFoodsWitFood>> snapshot) {
              var count = 0;
              if (snapshot.data != null) {
                // Number of entry
                count = snapshot.data.length;
              }
              return CustomColumnBuilder(
                itemCount: count,
                itemBuilder: (_, index) {
                  // Passing by a builder so one can display a snackbar after the dialog ended.
                  return Container(
                      color: Colors.white,
                      child: ListTile(
                        dense: true,
                        title: Text(snapshot.data[index].food.name),
                        trailing: Text(widget.formater.format(
                                snapshot.data[index].consumedCalories()) +
                            " calories"),
                      ));
                },
              );
            });
      }),
    ]);
  }

  _navigateAddFoodToMeal(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SelectFood(
                title: widget.title,
                mealType: widget.title,
              )),
    );
  }
}
