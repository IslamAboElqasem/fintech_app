import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? argument}) {
    return Navigator.of(this).pushNamed(routeName, arguments: argument);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
      String routeNamed, RoutePredicate predicate,
      {Object? argument}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeNamed, predicate, arguments: argument);
  }

  void pop() => Navigator.pop(this);
}

extension ThemeContext on BuildContext {
  // Quick access to the TextTheme
  TextTheme get textTheme => Theme.of(this).textTheme;
  
  // Optional: Quick access to specific styles (Super Clean)
  TextStyle? get displayLarge_32 => textTheme.displayLarge;
  TextStyle? get displayMedium_28 => textTheme.displayMedium;
  TextStyle? get displaySmall_20 => textTheme.displaySmall;
  TextStyle? get headlineMedium_18 => textTheme.headlineMedium;
  TextStyle? get titleMedium_16 => textTheme.titleMedium;
  TextStyle? get bodyLarge_16 => textTheme.bodyLarge;
  TextStyle? get bodyMedium_14 => textTheme.bodyMedium;
  TextStyle? get bodySmall_12 => textTheme.bodySmall;
  TextStyle? get labelLarge_16 => textTheme.labelLarge;
  TextStyle? get labelMedium_14 => textTheme.labelMedium;
  TextStyle? get labelSmall_12 => textTheme.labelSmall;
}

extension CompactNumber on double {
  String toCompact() {
    if (this >= 1e12) {
      return "${(this / 1e12).toStringAsFixed(1)}T";
    } else if (this >= 1e9) {
      return "${(this / 1e9).toStringAsFixed(1)}B";
    } else if (this >= 1e6) {
      return "${(this / 1e6).toStringAsFixed(1)}M";
    } else if (this >= 1e3) {
      return "${(this / 1e3).toStringAsFixed(1)}K";
    }
    return toStringAsFixed(2);
  }
}