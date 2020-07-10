import 'package:flutter/material.dart';
import 'package:moor/moor.dart' hide Column;
import 'package:open_weight/common/columnBuilder.dart';
import 'package:open_weight/common/helpers.dart';

//internal dependencies
import 'package:open_weight/database/db_helper.dart';
import 'package:open_weight/food/foodSelection.dart';
import 'package:provider/provider.dart';

class MealCard extends StatefulWidget {
  final date;
  final String title;

  MealCard({Key key, @required this.title, @required this.date})
      : super(key: key);

  @override
  _MealCardState createState() => _MealCardState();
}

class _MealCardState extends State<MealCard> {
  Stream<List<ConsumedFood>> consumedFoods;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Card(
          margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
          child: ListTile(
              title: Container(child: Text(widget.title)),
              subtitle: Text("Here meal total calorie."),
              trailing: IconButton(
                  icon: Icon(
                    Icons.add_circle,
                    color: Colors.green.shade500,
                    size: 35,
                  ),
                  onPressed: () {
                    _navigateAddFoodToMeal(context);
                  }))),
      Consumer<MyDatabase>(builder: (builder, database, child) {
        return StreamBuilder(
            initialData: List<ConsumedFood>(),
            stream: database.watchEntriesInDailyFoods(today()),
            builder: (BuildContext context,
                AsyncSnapshot<List<ConsumedFood>> snapshot) {
              var count = 0;
              if (snapshot.data != null) {
                count = snapshot.data.length;
              }
              return CustomColumnBuilder(
                itemCount: count,
                itemBuilder: (_, index) {
                  // Passing by a builder so one can display a snackbar after the dialog ended.
                  return Container(
                      color: Colors.white,
                      child: ListTile(
                        title: Text("${snapshot.data[index].consumedPortion}"),
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
      MaterialPageRoute(builder: (context) => SelectFood(title: "Select food")),
    );
  }
}
