/*  This file is part of the open calorie tracker project. 
 *  This application helps you to track the consumed calories on a daily basis.
 *  Copyright (C) 2020. Adrien FAURE
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <https://www.gnu.org/licenses/>. */

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_weight/common/helpers.dart';
import 'package:open_weight/common/ui.dart';

import '../application_localization.dart';

class DayCard extends StatelessWidget {
  final DateTime date;
  final DateTime selectedDate = DateTime.now();

  final onTapPrevious;
  final onTapNext;
  final onTapMiddle;

  final dayName = DateFormat("EEEE");
  final monthName = DateFormat("MMMM");
  DayCard(
      {@required this.date,
      this.onTapPrevious,
      this.onTapNext,
      this.onTapMiddle});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        color: Colors.white,
        child: Container(
            height: 50,
            child: Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                onTapNext != null
                    ? IconButton(
                        iconSize: 45,
                        icon: Icon(Icons.navigate_before, color: redTheme),
                        onPressed: onTapPrevious)
                    : Container(),
                Expanded(
                    child: GestureDetector(
                        onTap: onTapMiddle,
                        child: Container(
                            alignment: Alignment.center,
                            child: Text(dateFormat(context))))),
                onTapNext != null
                    ? IconButton(
                        iconSize: 45,
                        icon: Icon(Icons.navigate_next, color: redTheme),
                        onPressed: onTapNext,
                      )
                    : Container(),
              ],
            )));
  }

  String dateFormat(BuildContext context) {
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
      return text + " (${AppLocalizations.of(context).today})";
    else if (aDate == yesterday)
      return text + " (${AppLocalizations.of(context).yesterday})";
    else if (aDate == tomorrow)
      return text + " (${AppLocalizations.of(context).tomorrow})";

    return text;
  }
}
