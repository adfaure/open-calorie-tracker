import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_weight/database/db_helper.dart';

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

  String get profile {
    return Intl.message('Profile',
        name: 'profile', desc: 'profile (with a caps)');
  }

  String get drawerFood {
    return Intl.message('Foods',
        name: 'drawerFood', desc: 'Drawer: foods');
  }

  String get drawerAbout {
    return Intl.message('About',
        name: 'drawerAbout', desc: 'Drawer: about');
  }
  
  String get objective {
    return Intl.message('Objective',
        name: 'objective', desc: 'objective (starts with a caps)');
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
