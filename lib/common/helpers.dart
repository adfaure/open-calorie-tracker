// Similar to DateTime.now(), but without hours/second precision
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

/// Return true if the two dates are the same day,
/// ignoring secondes and hours.
bool isSameDay(final DateTime time1, final DateTime time2) {
  return (time1.day == time2.day &&
      time1.month == time2.month &&
      time1.year == time2.year);
}
