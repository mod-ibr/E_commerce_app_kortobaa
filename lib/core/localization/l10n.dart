import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class L10n {
  L10n._();

  static final List<Locale> supportedLocales = [
    const Locale('en'),
    const Locale('ar'),
  ];

  static final List<LocalizationsDelegate> localizationsDelegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  static LocaleResolutionCallback localeResolutionCallback(
      locale, supportedLocales) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale?.languageCode &&
          supportedLocale.countryCode == locale?.countryCode) {
        return supportedLocale;
      }
    }
    return supportedLocales.first;
  }
}

AppLocalizations getL10n(BuildContext context) => AppLocalizations.of(context)!;
