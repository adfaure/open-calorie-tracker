import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext build) {
    return Scaffold(
        backgroundColor: appBgColor,
        appBar: AppBar(
          title: Text("Journal"),
        ),
        drawer: ApplicationDrawer(),
        body: Consumer<MyDatabase>(builder: (builder, database, child) {
          return ListView(children: [
            DayCard(date: today()),
            Divider(height: 2, color: Colors.black,),
            CalorieMeter(),
            MealCard(
              title: "Breakfast",
            ),
            MealCard(
              title: "Lunch",
            ),
            MealCard(
              title: "Diner",
            ),
            MealCard(
              title: "Snacks",
            )
          ], padding: EdgeInsets.fromLTRB(0, 0, 0, 8));
        }));
  }
}
