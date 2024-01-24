import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocale {
  Locale locale;
  AppLocale(this.locale);

  late Map<String, String> _translations; // made it late
  // ignore: non_constant_identifier_names
  static AppLocale of(BuildContext, context) =>
      Localizations.of(context, AppLocale);

  Future loadLangJsonFile() async {
    String _langFile = await rootBundle
        .loadString('assets/translations/${locale.languageCode}.json');
    Map<String, dynamic> _loadedValues = jsonDecode(_langFile);
    _translations =
        _loadedValues.map((key, value) => MapEntry(key, value.toString()));
  }

  getTranslations(String key) {
    return _translations[key];
  }

  static const LocalizationsDelegate<AppLocale> delegate = _AppLocaleDelegate();
}

class _AppLocaleDelegate extends LocalizationsDelegate<AppLocale> {
  const _AppLocaleDelegate();
  @override
  bool isSupported(Locale locale) {
    return ["en", "ar"].contains(locale.languageCode);
  }

  @override
  Future<AppLocale> load(Locale locale) async {
    AppLocale appLocale = AppLocale(locale);
    await appLocale.loadLangJsonFile();
    return appLocale;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocale> old) => false;
}
