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

class JournalView extends StatefulWidget {
  final String title;

  JournalView({Key key, this.title}) : super(key: key);

  @override
  _JournalViewState createState() => _JournalViewState(today());
}

class _JournalViewState extends State<JournalView> {
  final objective = 1800;
  var date;

  _JournalViewState(this.date);

  // const JournalView({Key key, this.allDailyFood}) : super(key: key);

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
              stream: database.watchTotalDailyCalorie(this.date),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                var data = 0;
                if (snapshot.data != null) {
                  data = snapshot.data;
                }
                return ListView(children: [
                  DayCard(
                    date: this.date,
                    onTapMiddle: () => _selectDate(context),
                    onTapNext: () => {
                      this.setState(() {
                        var _nextDay = nextDay(this.date);
                        debugPrint("${this.date} -> $_nextDay");
                        this.date = _nextDay;
                      })
                    },
                    onTapPrevious: () => {
                      this.setState(() {
                        var _previousDay = previousDay(this.date);
                        debugPrint("${this.date} -> $_previousDay");

                        this.date = _previousDay;
                      })
                    },
                  ),
                  CalorieMeter(
                    consumedCalorie: data,
                    objective: 1800,
                  ),
                  MealCard(title: "Breakfast", date: this.date),
                  MealCard(title: "Lunch", date: this.date),
                  MealCard(title: "Diner", date: this.date),
                  MealCard(title: "Snacks", date: this.date)
                ], padding: EdgeInsets.fromLTRB(0, 0, 0, 8));
              });
        }));
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: this.date,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != this.date)
      this.setState(() {
        debugPrint("${this.date} -> $picked");
        this.date = picked;
      });
  }
}
