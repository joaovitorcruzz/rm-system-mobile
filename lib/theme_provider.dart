import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;
  bool get isDarkMode => _themeMode == ThemeMode.dark;

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  ThemeData get lightTheme {
    return ThemeData(
      primaryColor: const Color(0xFF0A2A45), // Azul escuro
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF0A2A45),
        foregroundColor: Colors.white,
      ),
      cardColor: Colors.grey[100],
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF3391DD), // Azul claro
          foregroundColor: Colors.white,
        ),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(fontFamily: 'Outfit'),
        bodyMedium: TextStyle(fontFamily: 'Outfit'),
      ),
      useMaterial3: true,
    );
  }

  ThemeData get darkTheme {
    return ThemeData(
      primaryColor: const Color(0xFF1A5687), // Azul médio
      scaffoldBackgroundColor: Colors.grey[900]!,
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1A5687),
        foregroundColor: Colors.white,
      ),
      cardColor: Colors.grey[800],
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF3391DD),
          foregroundColor: Colors.white,
        ),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(fontFamily: 'Outfit'),
        bodyMedium: TextStyle(fontFamily: 'Outfit'),
      ),
      useMaterial3: true,
    );
  }
}