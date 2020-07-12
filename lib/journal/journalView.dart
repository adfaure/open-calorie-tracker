import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_weight/common/columnBuilder.dart';
import 'package:open_weight/common/helpers.dart';
import 'package:provider/provider.dart';
// Internal dependencies
import 'package:open_weight/common/ui.dart';
import 'package:open_weight/application_drawer.dart';
import 'package:open_weight/journal/dayCard.dart';
import 'package:open_weight/journal/calorieMeter.dart';
import 'package:open_weight/journal/mealCard.dart';
import '../database/db_helper.dart';

class JournalView extends StatelessWidget {
  final title = "Journal";
  final allDailyFood;

  final objective = 1800;

  const JournalView({Key key, this.allDailyFood}) : super(key: key);

  // var database = Provider.of<MyDatabase>(context, listen: false);
  // List<ConsumedFoodsWitFood> totalFood =
  //     await database.getTotalDailyCalories(today());

  // var total = totalFood.fold(
  //     0,
  //     (previousValue, element) =>
  //         previousValue + element.consumedCalories());
  // debugPrint("total: $total");

  @override
  Widget build(BuildContext build) {
    return Scaffold(
        backgroundColor: appBgColor,
        appBar: AppBar(
          title: Text("Journal"),
        ),
        drawer: ApplicationDrawer(),
        body: Consumer<MyDatabase>(builder: (builder, database, child) {
          return StreamBuilder(
              stream: database.watchTotalDailyCalorie(today()),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return ListView(children: [
                  // DayCard(date: today()),
                  CalorieMeter(consumedCalorie: snapshot.data, objective: 1800,),
                  MealCard(title: "Breakfast", date: today()),
                  MealCard(title: "Lunch", date: today()),
                  MealCard(title: "Diner", date: today()),
                  MealCard(title: "Snacks", date: today())
                ], padding: EdgeInsets.fromLTRB(0, 0, 0, 8));
              });
        }));
  }
}
