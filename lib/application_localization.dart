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

  String get add {
    return Intl.message('Add', name: 'add', desc: 'Word: add');
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

  String get error {
    return Intl.message('Error', name: 'error', desc: 'Word: error');
  }

  String get lipids {
    return Intl.message('Lipids', name: 'lipids', desc: 'Word: lipids');
  }

  String get carbohydrates {
    return Intl.message('Carbohydrates',
        name: 'carbohydrates', desc: 'Word: carbohydrates');
  }

  String get proteins {
    return Intl.message('Proteins', name: 'proteins', desc: 'Word: proteins');
  }

  String dynamicNutriment(String nutriment) {
    switch (nutriment) {
      case "Lipids":
        {
          return this.lipids;
        }
      case "Carbohydrates":
        {
          return this.carbohydrates;
        }

      case "Proteins":
        {
          return this.proteins;
        }
    }
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
        name: 'invalidNumber', desc: 'Invalid int formatting');
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

  //Create food
  String get createNewFoodTtitle {
    return Intl.message("Create a new food",
        name: 'createNewFoodTtitle', desc: 'Title of the create food scafold');
  }

  String get newFood {
    return Intl.message("New Food",
        name: 'newFood', desc: 'New food box title');
  }

  String get foodNameRequired {
    return Intl.message("Food name (Required)",
        name: 'foodNameRequired', desc: 'food name field');
  }

  String get watermelon {
    return Intl.message("Watermelon",
        name: 'watermelon', desc: 'Food name hint');
  }

  String get brandField {
    return Intl.message("Brand (Optional):",
        name: 'brandField', desc: 'Fodds brand field');
  }

  String get brandFieldHint {
    return Intl.message("Raw",
        name: 'brandFieldHint', desc: 'Fodds brand field hint');
  }

  String get portionBoxTitle {
    return Intl.message("Enter portion size",
        name: 'portionBoxTitle', desc: 'Portion box title');
  }

  String get portionFieldTitle {
    return Intl.message("Portion (Required)",
        name: 'portionFieldTitle', desc: 'Portion field title');
  }

  // Food view
  String get serving {
    return Intl.message("Serving", name: 'serving', desc: 'Serving field');
  }

  String get servingUnit {
    return Intl.message("Serving unit",
        name: 'servingUnit', desc: 'Serving field');
  }

  String get source {
    return Intl.message("Source", name: 'source', desc: 'Source field name');
  }

  String get barcode {
    return Intl.message("Barcode", name: 'barcode', desc: 'Barcode field name');
  }

  //Open food fact
  String get networkErrorMessage {
    return Intl.message(
        'Network Error: Have you checked your internet connection?',
        name: 'networkErrorMessage',
        desc: 'Network error');
  }

  String get noEnergyInformationsFor {
    return Intl.message('No energy informations for',
        name: 'noEnergyInformationsFor',
        desc: 'No energy associated to product found in oof database');
  }

  String get scanFailPlatformError {
    return Intl.message('Failed to get platform version.',
        name: 'scanFailPlatformError', desc: 'fail scan');
  }

  // Food list
  String get foodListTitle {
    return Intl.message('Food list', name: 'foodListTitle', desc: '');
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
