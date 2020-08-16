import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_weight/database/db_helper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:df/df.dart';
import 'foodCard.dart';
import 'foodView.dart';

class SearchFood extends StatelessWidget {
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
                    onTap: () async {
                      // _showFoodView(context, snapshot.data[index]);
                      _loadData();
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

  _loadData() async {
    String filePath = "assets/data/ciqual_2020_fr_eng.csv";
    final byteData = await rootBundle.load(filePath);
    final localPath = (await getTemporaryDirectory()).path;
    String localFilePath = '$localPath/ciqual_2020_fr_eng.csv';

    final file = File(localFilePath);
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    final df = await DataFrame.fromCsv(localFilePath);
    df.show();
  }
}
