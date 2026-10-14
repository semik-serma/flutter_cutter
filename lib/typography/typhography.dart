import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Professional Typography Model for Flutter Material 3
abstract class AppTypography {
  // Base Font Family Configuration
  static TextStyle get _baseStyle => GoogleFonts.poppins();

  // ---------------------------------------------------------------------------
  // DISPLAY STYLES (Hero numbers, large promotional text)
  // ---------------------------------------------------------------------------
  static TextStyle get displayLarge => _baseStyle.copyWith(
    fontSize: 57,
    fontWeight: FontWeight.w400,
    height: 1.12, // ~64px line height
    letterSpacing: -0.25,
  );

  static TextStyle get displayMedium => _baseStyle.copyWith(
    fontSize: 45,
    fontWeight: FontWeight.w400,
    height: 1.15, // ~52px line height
    letterSpacing: 0.0,
  );

  static TextStyle get displaySmall => _baseStyle.copyWith(
    fontSize: 36,
    fontWeight: FontWeight.w400,
    height: 1.22, // ~44px line height
    letterSpacing: 0.0,
  );

  // ---------------------------------------------------------------------------
  // HEADLINE STYLES (Screen titles, section headers)
  // ---------------------------------------------------------------------------
  static TextStyle get headlineLarge => _baseStyle.copyWith(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    height: 1.25, // ~40px line height
    letterSpacing: 0.0,
  );

  static TextStyle get headlineMedium => _baseStyle.copyWith(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    height: 1.28, // ~36px line height
    letterSpacing: 0.0,
  );

  static TextStyle get headlineSmall => _baseStyle.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.33, // ~32px line height
    letterSpacing: 0.0,
  );

  // ---------------------------------------------------------------------------
  // TITLE STYLES (Subheadings, card titles, list tile titles)
  // ---------------------------------------------------------------------------
  static TextStyle get titleLarge => _baseStyle.copyWith(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    height: 1.27, // ~28px line height
    letterSpacing: 0.0,
  );

  static TextStyle get titleMedium => _baseStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.50, // ~24px line height
    letterSpacing: 0.15,
  );

  static TextStyle get titleSmall => _baseStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.43, // ~20px line height
    letterSpacing: 0.1,
  );

  // ---------------------------------------------------------------------------
  // BODY STYLES (Paragraphs, descriptions, form input text)
  // ---------------------------------------------------------------------------
  static TextStyle get bodyLarge => _baseStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.50, // ~24px line height
    letterSpacing: 0.5,
  );

  static TextStyle get bodyMedium => _baseStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.43, // ~20px line height
    letterSpacing: 0.25,
  );

  static TextStyle get bodySmall => _baseStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.33, // ~16px line height
    letterSpacing: 0.4,
  );

  // ---------------------------------------------------------------------------
  // LABEL STYLES (Buttons, tabs, input field labels, captions, badges)
  // ---------------------------------------------------------------------------
  static TextStyle get labelLarge => _baseStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.43, // ~20px line height
    letterSpacing: 0.1,
  );

  static TextStyle get labelMedium => _baseStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.33, // ~16px line height
    letterSpacing: 0.5,
  );

  static TextStyle get labelSmall => _baseStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    height: 1.45, // ~16px line height
    letterSpacing: 0.5,
  );

  // ---------------------------------------------------------------------------
  // CONSTRUCT COMPLETE TEXT THEMES
  // ---------------------------------------------------------------------------
  static TextTheme createTextTheme({required Color primaryTextColor}) {
    return TextTheme(
      displayLarge: displayLarge.copyWith(color: primaryTextColor),
      displayMedium: displayMedium.copyWith(color: primaryTextColor),
      displaySmall: displaySmall.copyWith(color: primaryTextColor),
      headlineLarge: headlineLarge.copyWith(color: primaryTextColor),
      headlineMedium: headlineMedium.copyWith(color: primaryTextColor),
      headlineSmall: headlineSmall.copyWith(color: primaryTextColor),
      titleLarge: titleLarge.copyWith(color: primaryTextColor),
      titleMedium: titleMedium.copyWith(color: primaryTextColor),
      titleSmall: titleSmall.copyWith(color: primaryTextColor),
      bodyLarge: bodyLarge.copyWith(color: primaryTextColor),
      bodyMedium: bodyMedium.copyWith(color: primaryTextColor),
      bodySmall: bodySmall.copyWith(color: primaryTextColor),
      labelLarge: labelLarge.copyWith(color: primaryTextColor),
      labelMedium: labelMedium.copyWith(color: primaryTextColor),
      labelSmall: labelSmall.copyWith(color: primaryTextColor),
    );
  }
}
