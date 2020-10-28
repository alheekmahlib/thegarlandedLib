import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thegarlanded/l10n/messages_all.dart';
import 'package:preferences/preference_service.dart';
import 'package:quiver/strings.dart';

// Run this flutter packages pub run intl_translation:extract_to_arb --output-dir=lib/l10n lib/localizations/app_localizations.dart
// Copy base arb (intl_messages.arb) to each language
// Run this flutter packages pub run intl_translation:generate_from_arb --output-dir=lib/l10n \ --no-use-deferred-loading lib/localizations/app_localizations.dart lib/l10n/intl_*.arb
// Run above command every time we change arb file

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name =
    isBlank(locale?.countryCode) ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }


  String lang(){
    return PrefService.getString("locale");
  }

  String get appName {
    return Intl.message(
      'The Garlanded',
      name: 'appName',
      desc: 'appName',
    );
  }

  String get home {
    return Intl.message(
      'The Garlanded',
      name: 'home',
      desc: 'home',
    );
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  Locale locale;
  List<Locale> supportedLocales;

  AppLocalizationsDelegate({
    this.locale,
    this.supportedLocales,
  });

  @override
  bool isSupported(Locale locale) =>
      supportedLocales.map((v) => v.languageCode).contains(locale.languageCode);

// This does not change
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(AppLocalizationsDelegate old) => true;
}
