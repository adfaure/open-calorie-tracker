import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_weight/common/helpers.dart';

class DayCard extends StatelessWidget {
  final DateTime date;
  DayCard(
      {@required this.date,
      this.onTapPrevious,
      this.onTapNext,
      this.onTapMiddle});

  DateTime selectedDate = DateTime.now();

  final onTapPrevious;
  final onTapNext;
  final onTapMiddle;

  final dayName = DateFormat("EEEE");
  final monthName = DateFormat("MMMM");

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
        height: 55,
        color: Colors.white,
        child: Row(
          children: [
            SizedBox(
              width: 15,
            ),
            IconButton(
                iconSize: 45,
                icon: Icon(Icons.navigate_before, color: Colors.blue),
                onPressed: onTapPrevious),
            Expanded(
                child: GestureDetector(
                    onTap: onTapMiddle,
                    child: Container(
                        alignment: Alignment.center,
                        child: Text(dateFormat())))),
            IconButton(
              iconSize: 45,
              icon: Icon(Icons.navigate_next, color: Colors.blue),
              onPressed: onTapNext,
            ),
            SizedBox(
              width: 15,
            ),
          ],
        ));
  }

  String dateFormat() {
    final now = DateTime.now();
    final _today = today();
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final tomorrow = DateTime(now.year, now.month, now.day + 1);
    var day = dayName.format(date);
    var month = monthName.format(date);

    final aDate = DateTime(date.year, date.month, date.day);
    var text = "$day, ${date.day}. $month";
    if (date.year != now.year) {
      text += ". ${date.year}";
    }
    if (aDate == _today)
      return text + " (Today)";
    else if (aDate == yesterday)
      return text + " (Yesterday)";
    else if (aDate == tomorrow) return text + " (Tomorrow)";

    return text;
  }
}
