// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static m0(total) => "Total: ${total} kcal";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "available" : MessageLookupByLibrary.simpleMessage("Available"),
    "availableCalories" : MessageLookupByLibrary.simpleMessage("Available calories:"),
    "caloriePerPortion" : MessageLookupByLibrary.simpleMessage("Calorie per Portion"),
    "cancel" : MessageLookupByLibrary.simpleMessage("Cancel"),
    "consumed" : MessageLookupByLibrary.simpleMessage("Consumed"),
    "continueWord" : MessageLookupByLibrary.simpleMessage("Continue"),
    "drawerAbout" : MessageLookupByLibrary.simpleMessage("About"),
    "drawerFood" : MessageLookupByLibrary.simpleMessage("Foods"),
    "invalidNumber" : MessageLookupByLibrary.simpleMessage("Invalid number"),
    "objective" : MessageLookupByLibrary.simpleMessage("Objective"),
    "profile" : MessageLookupByLibrary.simpleMessage("Profile"),
    "requirePositiveNumber" : MessageLookupByLibrary.simpleMessage("Require positive number"),
    "thisFoodWillBeDeleted" : MessageLookupByLibrary.simpleMessage("This food will be deleted."),
    "title" : MessageLookupByLibrary.simpleMessage("Food Assistant"),
    "today" : MessageLookupByLibrary.simpleMessage("Today"),
    "tomorrow" : MessageLookupByLibrary.simpleMessage("Tomorrow"),
    "totalKcal" : m0,
    "yesterday" : MessageLookupByLibrary.simpleMessage("Yesterday")
  };
}
