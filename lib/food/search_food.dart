import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_weight/database/db_helper.dart';
import 'package:provider/provider.dart';
import 'foodCard.dart';
import 'foodView.dart';

class SearchFood extends StatelessWidget {
  @override
  Widget build(BuildContext build) {
    return Column(children: <Widget>[
      Card(
          margin: EdgeInsets.all(0),
          child: ListTile(
            leading: Icon(Icons.search),
            trailing: Icon(
              FontAwesomeIcons.barcode,
              color: Colors.red,
            ),
            title: TextField(),
          )),
      Expanded(child: Consumer<MyDatabase>(builder: (builder, database, child) {
        return StreamBuilder(
            stream: database.watchEntriesInFoods(),
            initialData: List<FoodModel>(),
            builder: (BuildContext context,
                AsyncSnapshot<List<FoodModel>> snapshot) {
              return ListView.builder(
                // When the widget is first initialize, the data is null.
                // Tertiary operators prevent getting an error (It might be seen as a workaround, idk yet)
                itemCount: snapshot.data.length ?? 0,
                itemBuilder: (_, index) {
                  return new GestureDetector(
                      onTap: () async {
                        _showFoodView(context, snapshot.data[index]);
                      },
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
      }))
    ]);
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
