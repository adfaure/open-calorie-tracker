import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_weight/food/createFood.dart';
import 'package:open_weight/food/foodCard.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../database/db_helper.dart';

/// This widget should be called when one wishes to select a food, and a portion of it.
/// However, it is very similar (not to say copied-pasted) from [food.dart].
/// TODO: find a way to remove this duplication.
class SelectFood extends StatelessWidget {
  SelectFood({Key key, @required this.title, this.foodsItem}) : super(key: key);

  final Stream<List<Food>> foodsItem;
  final String title;
  final bgColor = Color(0xFFe3e3e3);
  final _dialogKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext build) {
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          title: Text(title),
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
                    // Passing by a builder so one can display a snackbar after the dialog ended.
                    return GestureDetector(
                        onTap: () => {
                              _getNumborOfPortion(context, snapshot.data[index])
                            },
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
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateFoodForm()),
    );
  }

  /// Show dialog asking for the number of portion to add from selected food.
  Future<void> _getNumborOfPortion(
      BuildContext context, Food selectedFood) async {
    final formatter = new NumberFormat("#");
    final numberOfPortionCtrl = TextEditingController();

    var portionSize = await showDialog<double>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Center(
                child: Column(children: [
              Text(
                'Number of portion: ${selectedFood.name}',
              ),
              Text(
                '(Portion size: ' +
                    formatter.format(selectedFood.portion) +
                    "${selectedFood.unit})",
                textAlign: TextAlign.left,
                textScaleFactor: 0.7,
              )
            ])),
            children: <Widget>[
              Row(children: [
                SizedBox(
                  width: 50,
                ),
                Expanded(
                  child: Form(
                      key: _dialogKey,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        controller: numberOfPortionCtrl,
                        decoration: InputDecoration(
                          hintText: "1.5",
                        ),
                        validator: (value) {
                          var doubleString =
                              numberOfPortionCtrl.text.replaceAll(",", ".");
                          var portionSize;
                          try {
                            portionSize = double.parse(doubleString);
                          } catch (e) {
                            return "Unvalid portion size.";
                          }
                          if (portionSize <= 0) {
                            return "Require positive number.";
                          }
                          return null;
                        },
                        onFieldSubmitted: (newValue) {
                          if (_dialogKey.currentState.validate()) {
                            var doubleString =
                                numberOfPortionCtrl.text.replaceAll(",", ".");
                            Navigator.pop(context, double.parse(doubleString));
                          }
                        },
                      )),
                ),
                SizedBox(
                  width: 50,
                ),
              ]),
            ],
          );
        });

    /// Once the dialgo returns a valid portio size
    /// we return to the previous vue.
    if (portionSize != null) {
      Navigator.of(context).pop(context);
    }

  }
}
