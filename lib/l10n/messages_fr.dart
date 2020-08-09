// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
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
  String get localeName => 'fr';

  static m0(total) => "Total: ${total} kcal";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "available" : MessageLookupByLibrary.simpleMessage("Disponibles"),
    "availableCalories" : MessageLookupByLibrary.simpleMessage("Calories disponibles:"),
    "breakfast" : MessageLookupByLibrary.simpleMessage("Petit déjeuner"),
    "calorie" : MessageLookupByLibrary.simpleMessage("Calorie"),
    "caloriePerPortion" : MessageLookupByLibrary.simpleMessage("Calories par portion"),
    "cancel" : MessageLookupByLibrary.simpleMessage("Annuler"),
    "consumed" : MessageLookupByLibrary.simpleMessage("Consomées"),
    "continueWord" : MessageLookupByLibrary.simpleMessage("Continuer"),
    "date" : MessageLookupByLibrary.simpleMessage("Date"),
    "diner" : MessageLookupByLibrary.simpleMessage("Diner"),
    "drawerAbout" : MessageLookupByLibrary.simpleMessage("À propos"),
    "drawerFood" : MessageLookupByLibrary.simpleMessage("Aliments"),
    "invalidNumber" : MessageLookupByLibrary.simpleMessage("Nombre invalide"),
    "lunch" : MessageLookupByLibrary.simpleMessage("Déjeuner"),
    "mealType" : MessageLookupByLibrary.simpleMessage("Type de repas"),
    "name" : MessageLookupByLibrary.simpleMessage("Nom"),
    "objective" : MessageLookupByLibrary.simpleMessage("Objectif"),
    "portion" : MessageLookupByLibrary.simpleMessage("Portion"),
    "profile" : MessageLookupByLibrary.simpleMessage("Profil"),
    "quantity" : MessageLookupByLibrary.simpleMessage("Quantité"),
    "requirePositiveNumber" : MessageLookupByLibrary.simpleMessage("Nombre positif requis"),
    "snacks" : MessageLookupByLibrary.simpleMessage("Collations"),
    "thisFoodWillBeDeleted" : MessageLookupByLibrary.simpleMessage("L\'aliment va être supprimé."),
    "title" : MessageLookupByLibrary.simpleMessage("Food Assistant"),
    "today" : MessageLookupByLibrary.simpleMessage("Aujourd\'hui"),
    "tomorrow" : MessageLookupByLibrary.simpleMessage("Demain"),
    "totalKcal" : m0,
    "unit" : MessageLookupByLibrary.simpleMessage("Unité"),
    "yesterday" : MessageLookupByLibrary.simpleMessage("Hier")
  };
}
