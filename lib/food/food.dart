import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_weight/food/createFood.dart';
import 'package:open_weight/food/foodCard.dart';
import 'package:open_weight/food/foodView.dart';
import 'package:provider/provider.dart';

import '../database/db_helper.dart';

class ListFood extends StatefulWidget {
  ListFood({Key key}) : super(key: key);
  final String title = "Your food";
  final bgColor = Color(0xFFe3e3e3);

  @override
  _ListFoodState createState() => _ListFoodState();
}

class _ListFoodState extends State<ListFood> {
  Stream<List<Food>> foodsItem;

  @override
  Widget build(BuildContext build) {
    return Scaffold(
        backgroundColor: widget.bgColor,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Consumer<MyDatabase>(builder: (builder, database, child) {
          return StreamBuilder(
              stream: database.watchEntriesInFoods(),
              initialData: List<Food>(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Food>> snapshot) {
                return ListView.builder(
                  // When the widget is first initialize, the data is null.
                  // Tertiary operators prevent getting an error (It might be seen as a workaround, idk yet)
                  itemCount: snapshot.data.length ?? 0,
                  itemBuilder: (_, index) {
                    return new GestureDetector(
                        onTap: () =>
                            {_showFoodView(context, snapshot.data[index])},
                        child: FoodCard(
                            food: snapshot.data[index],
                            actionButton: IconButton(
                              icon: Icon(Icons.delete_outline),
                              onPressed: () {
                                setState(() {
                                  database.deleteFood(snapshot.data[index]);
                                });
                              },
                              color: Colors.red,
                            )));
                  },
                );
              });
        }),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
              onPressed: () => _navigateAndDisplaySelection(context),
              tooltip: 'Increment',
              child: Icon(Icons
                  .add)), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }

  _showFoodView(BuildContext context, Food food) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => FoodView(
                food: food,
              )),
    );
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateFoodForm()),
    );
  }
}
