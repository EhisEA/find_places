import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeService extends ChangeNotifier{
  bool isDark =false;

  ThemeService(){
    _getFromPref();
  }
  toggleTheme(){
    isDark= !isDark;
    notifyListeners();
    _saveToPref();
  }

   Future<void> _getFromPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
     isDark = prefs.getBool('isDark')??isDark;
     notifyListeners();
  }


   Future<void> _saveToPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDark',isDark);
  }
}