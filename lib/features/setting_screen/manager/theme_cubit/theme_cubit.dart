// 1. Theme state (theme_state.dart) - Same as before
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_flutter_tasks/core/utils/app_colors.dart';
import 'package:nti_flutter_tasks/features/setting_screen/manager/theme_cubit/theme_state.dart';

import 'package:shared_preferences/shared_preferences.dart';

// 2. Theme cubit with SharedPreferences instead of HydratedBloc

class ThemeCubit extends Cubit<ThemeState> {
  static const String THEME_KEY = 'isDarkMode';

  ThemeCubit() : super(ThemeState(isDarkMode: false)) {
    _loadTheme();
  }

  static ThemeCubit get(context) => BlocProvider.of(context);
  // Load saved theme
  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool(THEME_KEY) ?? false;
    emit(ThemeState(isDarkMode: isDarkMode));
  }

  // Save theme preference
  Future<void> _saveTheme(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(THEME_KEY, isDarkMode);
  }

  // Toggle theme
  void toggleTheme() async {
    final newIsDarkMode = !state.isDarkMode;
    emit(ThemeState(isDarkMode: newIsDarkMode));
    await _saveTheme(newIsDarkMode);
  }

  void setDarkMode() async {
    emit(ThemeState(isDarkMode: true));
    await _saveTheme(true);
  }

  void setLightMode() async {
    emit(ThemeState(isDarkMode: false));
    await _saveTheme(false);
  }

  ThemeData getTheme() => state.isDarkMode ? darkTheme : lightTheme;

  // Light theme definition
  static final ThemeData lightTheme = ThemeData(
    
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    iconTheme: IconThemeData(color: AppColors.black),
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(color: Colors.black87),
      bodyMedium: TextStyle(color: Colors.black54),
    ),
    cardTheme: CardTheme(color: Colors.white, shadowColor: Colors.black26),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      // selectedItemColor: AppColors.primary,
      // unselectedItemColor: AppColors.black,
    ),
  );

  // Dark theme definition
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color(0xFF2F80ED),
    scaffoldBackgroundColor: Color.fromARGB(255, 159, 161, 161),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.pink,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    iconTheme: IconThemeData(color: AppColors.white),
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(color: const Color.fromARGB(179, 201, 29, 29)),
      bodyMedium: TextStyle(color: Colors.white54),
    ),
    cardTheme: CardTheme(color: Color(0xFF1F1F1F), shadowColor: Colors.black45),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF2F80ED),
        foregroundColor: Colors.white,
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 5,
      backgroundColor: Color.fromARGB(255, 11, 85, 189),
      // selectedItemColor: Colors.white,
      // unselectedItemColor: Colors.white54,
    ),
  );
}
