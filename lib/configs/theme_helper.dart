import 'package:flutter/material.dart';

class ThemeHelper {
  static const Color kPrimaryColor = Color(0xFF1976D2);
  static const Color kSecondaryColor = Color(0xFFD81B60);
  static const Color kTransparenteColor = Colors.transparent;
  static const Color kTextColor = Color(0xFF757575);
  static const Color kBackgroundColor = Color(0xFFF5F5F5);

  static ThemeData get theme => ThemeData(
        primaryColor: kPrimaryColor,
        hintColor: kSecondaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: kTextColor),
          bodyMedium: TextStyle(color: kTextColor),
        ),
        appBarTheme: const AppBarTheme(
          color: kPrimaryColor,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor,
            foregroundColor: Colors.white,
          ),
        ),
      );
}