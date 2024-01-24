import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageSet with ChangeNotifier {
  Locale _locale = Locale('en', '');

  get locale => _locale;

  void setLang(String lang) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('lang', lang);
    _locale = Locale(sharedPreferences.getString('lang')!, '');
    notifyListeners();
  }
}
