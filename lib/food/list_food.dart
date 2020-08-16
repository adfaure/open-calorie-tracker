import 'package:flutter/material.dart';
import 'package:open_weight/database/db_helper.dart';
import 'package:provider/provider.dart';

import 'foodCard.dart';
import 'foodView.dart';

class FoodList extends StatelessWidget {
  @override
  Widget build(BuildContext build) {
    return Consumer<MyDatabase>(builder: (builder, database, child) {
      return StreamBuilder(
          stream: database.watchEntriesInFoods(),
          initialData: List<FoodModel>(),
          builder:
              (BuildContext context, AsyncSnapshot<List<FoodModel>> snapshot) {
            return ListView.builder(
              // When the widget is first initialize, the data is null.
              // Tertiary operators prevent getting an error (It might be seen as a workaround, idk yet)
              itemCount: snapshot.data.length ?? 0,
              itemBuilder: (_, index) {
                return new GestureDetector(
                    onTap: () => {_showFoodView(context, snapshot.data[index])},
                    child: FoodCard(
                        food: snapshot.data[index],
                        actionButton: IconButton(
                          icon: Icon(Icons.delete_outline),
                          onPressed: () {
                            var entry = snapshot.data[index];
                            database.deleteFoodModel(entry);
                          },
                          color: Colors.red,
                        )));
              },
            );
          });
    });
  }

  _showFoodView(BuildContext context, FoodModel food) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => FoodView(
                food: food,
              )),
    );
  }
}
