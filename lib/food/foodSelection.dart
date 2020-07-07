import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_weight/food/createFood.dart';
import 'package:open_weight/food/foodCard.dart';
import 'package:open_weight/food/foodView.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../database/db_helper.dart';

class SelectFood extends StatefulWidget {
  SelectFood({Key key, @required this.title}) : super(key: key);
  final String title;
  final bgColor = Color(0xFFe3e3e3);

  @override
  _SelectFoodState createState() => _SelectFoodState();
}

class _SelectFoodState extends State<SelectFood> {
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
                            {_getNumborOfPortion(snapshot.data[index])},
                        child: FoodCard(
                          food: snapshot.data[index],
                        ));
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

  _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateFoodForm()),
    );
  }

  /// Show dialog asking for the number of portion to add from selected food.
  Future<void> _getNumborOfPortion(Food selectedFood) async {
    final formatter = new NumberFormat("#");
    final numberOfPortionCtrl = TextEditingController();
    var numberOfPortion = await showDialog<double>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title:
                Center(child: Text('Number of portion: ${selectedFood.name}')),
            children: <Widget>[
              Row(children: [
                Expanded(
                  child: Container(),
                ),
                Container(
                  child: Text(formatter.format(selectedFood.portion) +
                      "${selectedFood.unit} x "),
                ),
                Container(
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    controller: numberOfPortionCtrl,
                    onSubmitted: (newValue) {
                      var doubleString =
                          numberOfPortionCtrl.text.replaceAll(",", ".");
                      // TODO: What is the proper way to handle errors.
                      try {
                        double.parse(doubleString);
                      } catch (e) {
                        print(e);
                      }
                      Navigator.pop(context, double.parse(doubleString));
                    },
                  ),
                  width: 70,
                ),
                Expanded(
                  child: Container(),
                ),
              ]),
            ],
          );
        });
    return numberOfPortion;
  }
}
