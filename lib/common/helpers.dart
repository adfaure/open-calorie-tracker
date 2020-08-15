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

// Similar to DateTime.now(), but without hours/second precision
import 'package:open_weight/database/db_helper.dart';

DateTime today() {
  DateTime now = new DateTime.now();
  return new DateTime(now.year, now.month, now.day);
}

DateTime previousDay(final DateTime time) {
  return DateTime(time.year, time.month, time.day - 1);
}

DateTime nextDay(final DateTime time) {
  return DateTime(time.year, time.month, time.day + 1);
}

// Return the same day, with without hours and seconds if any
DateTime cleanDate(final DateTime date) {
  return DateTime(date.year, date.month, date.day);
}

/// Return true if the two dates are the same day,
/// ignoring secondes and hours.
bool isSameDay(final DateTime time1, final DateTime time2) {
  return (time1.day == time2.day &&
      time1.month == time2.month &&
      time1.year == time2.year);
}

int consumedCalories(ConsumedFood consumedFood) {
  var caloriesPerUnit = consumedFood.calorie / consumedFood.portion;
  var total = consumedFood.quantity * caloriesPerUnit;
  return total.round();
}
