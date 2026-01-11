import 'package:fintech_app/core/theme/dark_theme.dart';
import 'package:fintech_app/core/theme/light_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  // Private constructor to prevent instantiation
  AppTheme._();

  /// Light Theme
  static ThemeData get lightTheme => LightTheme.theme;

  /// Dark Theme
  static ThemeData get darkTheme => DarkTheme.theme;
}
