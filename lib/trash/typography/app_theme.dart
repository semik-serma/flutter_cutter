import 'package:flutter/material.dart';
import 'package:new_flutter_project/trash/typography/typhography.dart';

class AppTheme {
  // Light Theme Setup
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorSchemeSeed: Colors.blue,
      textTheme: AppTypography.createTextTheme(
        primaryTextColor: const Color(
          0xFF1F1F1F,
        ), // Dark charcoal for high contrast
      ),
    );
  }

  // Dark Theme Setup
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorSchemeSeed: Colors.blue,
      textTheme: AppTypography.createTextTheme(
        primaryTextColor: const Color(
          0xFFE3E3E3,
        ), // Soft off-white for low eye strain
      ),
    );
  }
}
