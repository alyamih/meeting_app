import 'package:flutter/material.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
      primarySwatch: Colors.orange,
      scaffoldBackgroundColor: const Color(0xFFEBF5ED),
      colorScheme: const ColorScheme.light(
        background: Color(0xFFEBF5ED),
        primary: Color(0xFF2E3B37),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
      ));

  static ThemeData darkTheme = ThemeData(
      primarySwatch: Colors.orange,
      scaffoldBackgroundColor: const Color(0xFF1E2321),
      colorScheme: const ColorScheme.dark(
        background: Color(0xFF0A1A35),
        primary: Color(0xFFEBF5ED),
      ),
      appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF0A1A35)));
}
