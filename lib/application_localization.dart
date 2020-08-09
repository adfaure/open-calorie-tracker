import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'l10n/messages_all.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get title {
    return Intl.message('Food Assistant',
        name: 'title', desc: 'The application title');
  }

  String get name {
    return Intl.message('Name', name: 'name', desc: 'Word: name');
  }

  String get date {
    return Intl.message('Date', name: 'date', desc: 'Word: date');
  }

  String get calorie {
    return Intl.message('Calorie', name: 'calorie', desc: 'Word: calorie');
  }

  String get unit {
    return Intl.message('Unit', name: 'unit', desc: 'Word: unit');
  }

  String get quantity {
    return Intl.message('Quantity', name: 'quantity', desc: 'Word: quantity');
  }

  String get mealType {
    return Intl.message('Meal type', name: 'mealType', desc: 'Meal type');
  }

  String get portion {
    return Intl.message('Portion', name: 'portion', desc: 'Word: portion');
  }

  // Words
  String get profile {
    return Intl.message('Profile',
        name: 'profile', desc: 'profile (with a caps)');
  }

  String get objective {
    return Intl.message('Objective',
        name: 'objective', desc: 'objective (starts with a caps)');
  }

  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: 'Dialog cancel button');
  }

  // continue is a dart keyword
  String get continueWord {
    return Intl.message('Continue',
        name: 'continueWord', desc: 'Dialog continue button');
  }

  String get consumed {
    return Intl.message('Consumed',
        name: 'consumed', desc: 'Calorie meter consumed food');
  }

  String get available {
    return Intl.message('Available',
        name: 'available', desc: 'Calorie meter available');
  }

  String get diner {
    return Intl.message('Diner', name: 'diner', desc: '');
  }

  String get lunch {
    return Intl.message('Lunch', name: 'lunch', desc: '');
  }

  String get breakfast {
    return Intl.message('Breakfast', name: 'breakfast', desc: '');
  }

  String get snacks {
    return Intl.message('Snacks', name: 'snacks', desc: '');
  }

  String localizedMealtype(String mealType) {
    switch (mealType) {
      case "Diner":
        {
          return this.diner;
        }
      case "Breakfast":
        {
          return this.breakfast;
        }

      case "Lunch":
        {
          return this.lunch;
        }
      case "Snacks":
        {
          return this.snacks;
        }
    }
  }

  String get tomorrow {
    return Intl.message('Tomorrow', name: 'tomorrow', desc: 'tomorrow');
  }

  String get yesterday {
    return Intl.message('Yesterday', name: 'yesterday', desc: 'yesterday');
  }

  String get today {
    return Intl.message('Today', name: 'today', desc: 'Today');
  }

  // Drawer menu titles
  String get drawerFood {
    return Intl.message('Foods', name: 'drawerFood', desc: 'Drawer: foods');
  }

  String get drawerAbout {
    return Intl.message('About', name: 'drawerAbout', desc: 'Drawer: about');
  }

  // Calorie meter
  String get availableCalories {
    return Intl.message('Available calories:',
        name: 'availableCalories', desc: 'Calorie meter available calories');
  }

  // Objective dialog
  String get invalidNumber {
    return Intl.message('Invalid number',
        name: 'invalidNumber', desc: 'Invalid int formating');
  }

  String get requirePositiveNumber {
    return Intl.message('Require positive number',
        name: 'requirePositiveNumber', desc: '');
  }

  totalKcal(total) => Intl.message("Total: $total kcal",
      name: "totalKcal",
      args: [total],
      desc: "Display the total calorie consumed");

  // Mealcard
  String get thisFoodWillBeDeleted {
    return Intl.message('This food will be deleted.',
        name: 'thisFoodWillBeDeleted',
        desc: 'Ask confirmation to delete a consumed food');
  }

  //Consumed food view
    String get caloriePerPortion {
    return Intl.message("Calorie per Portion",
        name: 'caloriePerPortion',
        desc: 'Calorie per portion in consumed food view');
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'fr'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
