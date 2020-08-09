// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a messages locale. All the
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
  String get localeName => 'messages';

  static m0(total) => "Total: ${total} kcal";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "available" : MessageLookupByLibrary.simpleMessage("Available"),
    "availableCalories" : MessageLookupByLibrary.simpleMessage("Available calories:"),
    "brandField" : MessageLookupByLibrary.simpleMessage("Brand (Optional):"),
    "brandFieldHint" : MessageLookupByLibrary.simpleMessage("Raw"),
    "breakfast" : MessageLookupByLibrary.simpleMessage("Breakfast"),
    "calorie" : MessageLookupByLibrary.simpleMessage("Calorie"),
    "caloriePerPortion" : MessageLookupByLibrary.simpleMessage("Calorie per Portion"),
    "cancel" : MessageLookupByLibrary.simpleMessage("Cancel"),
    "consumed" : MessageLookupByLibrary.simpleMessage("Consumed"),
    "continueWord" : MessageLookupByLibrary.simpleMessage("Continue"),
    "createNewFoodTtitle" : MessageLookupByLibrary.simpleMessage("Create a new food"),
    "date" : MessageLookupByLibrary.simpleMessage("Date"),
    "diner" : MessageLookupByLibrary.simpleMessage("Diner"),
    "drawerAbout" : MessageLookupByLibrary.simpleMessage("About"),
    "drawerFood" : MessageLookupByLibrary.simpleMessage("Foods"),
    "foodNameRequired" : MessageLookupByLibrary.simpleMessage("Food name (Required)"),
    "invalidNumber" : MessageLookupByLibrary.simpleMessage("Invalid number"),
    "lunch" : MessageLookupByLibrary.simpleMessage("Lunch"),
    "mealType" : MessageLookupByLibrary.simpleMessage("Meal type"),
    "name" : MessageLookupByLibrary.simpleMessage("Name"),
    "newFood" : MessageLookupByLibrary.simpleMessage("New Food"),
    "objective" : MessageLookupByLibrary.simpleMessage("Objective"),
    "portion" : MessageLookupByLibrary.simpleMessage("Portion"),
    "portionBoxTitle" : MessageLookupByLibrary.simpleMessage("Enter portion size"),
    "portionFieldTitle" : MessageLookupByLibrary.simpleMessage("Portion (Required)"),
    "profile" : MessageLookupByLibrary.simpleMessage("Profile"),
    "quantity" : MessageLookupByLibrary.simpleMessage("Quantity"),
    "requirePositiveNumber" : MessageLookupByLibrary.simpleMessage("Require positive number"),
    "snacks" : MessageLookupByLibrary.simpleMessage("Snacks"),
    "thisFoodWillBeDeleted" : MessageLookupByLibrary.simpleMessage("This food will be deleted."),
    "title" : MessageLookupByLibrary.simpleMessage("Food Assistant"),
    "today" : MessageLookupByLibrary.simpleMessage("Today"),
    "tomorrow" : MessageLookupByLibrary.simpleMessage("Tomorrow"),
    "totalKcal" : m0,
    "unit" : MessageLookupByLibrary.simpleMessage("Unit"),
    "watermelon" : MessageLookupByLibrary.simpleMessage("Watermelon"),
    "yesterday" : MessageLookupByLibrary.simpleMessage("Yesterday")
  };
}
