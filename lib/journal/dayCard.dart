import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DayCard extends StatelessWidget {
  DateTime date;
  DayCard({@required this.date});

  final dayName = DateFormat("EEEE");
  final monthName = DateFormat("MMMM");

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35,
        color: Colors.white,
        child: Row(
          children: [
            Icon(
              Icons.navigate_before,
              color: Colors.blue,
              size: 36.0,
            ),
            Expanded(
                child: Container(
                    alignment: Alignment.center, child: Text(dateFormat()))),
            Icon(
              Icons.navigate_next,
              color: Colors.blue,
              size: 36.0,
            ),
          ],
        ));
  }

  String dateFormat() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final tomorrow = DateTime(now.year, now.month, now.day + 1);
    var day = dayName.format(date);
    var month = monthName.format(date);

    final aDate = DateTime(date.year, date.month, date.day);
    var text = "$day, $month. ${date.weekday}";
    if (aDate == today)
      return text + " (Today)";
    else if (aDate == yesterday)
      return text + " (Yesterday)";
    else if (aDate == tomorrow) return text + " (Tomorrow)";

    return text;
  }
}
