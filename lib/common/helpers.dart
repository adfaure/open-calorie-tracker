// Similar to DateTime.now(), but without hours/second precision
import 'package:flutter/rendering.dart';

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