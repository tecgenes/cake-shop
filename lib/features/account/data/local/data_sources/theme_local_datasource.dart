import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeLocalDatasource {
  static isSavedDarkMode() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.getBool("darkMode");
  }

  static saveThemeMode(bool isDarkMode) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("darkMode", isDarkMode);
  }

  static ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  static ThemeMode changeThemeMode(){
    if(isSavedDarkMode()){
      saveThemeMode(! isSavedDarkMode());
      return ThemeMode.light;
    }else{
      saveThemeMode(! isSavedDarkMode());
      return ThemeMode.dark;
    }
  }
}
