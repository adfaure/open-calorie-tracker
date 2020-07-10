// Similar to DateTime.now(), but without hours/second precision
DateTime today() { 
  DateTime now = new DateTime.now();
  return new DateTime(now.year, now.month, now.day);
}