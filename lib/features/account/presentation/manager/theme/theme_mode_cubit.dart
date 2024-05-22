import 'package:cake_shop/config/injectable/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeModeEvent { toggle }

// Define the Cubit
class ThemeModeCubit extends Cubit<ThemeMode> {
  ThemeModeCubit() : super(ThemeMode.light) {
    _loadThemeMode();
  }

  // Method to toggle theme mode
  void toggleTheme() {
    emit(state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);
    _saveThemeMode();
  }

  // Method to save theme mode locally
  void _saveThemeMode() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    Dependencies.inject.getAsync<SharedPreferences>().then((prefs){
      prefs.setBool('isDarkMode', state == ThemeMode.dark);
    });
  }

  // Method to load theme mode locally
  void _loadThemeMode() async {
    Dependencies.inject.getAsync<SharedPreferences>().then((prefs){
      bool isDarkMode = prefs.getBool('isDarkMode') ?? false;
      emit(isDarkMode ? ThemeMode.dark : ThemeMode.light);
    });
  }
}