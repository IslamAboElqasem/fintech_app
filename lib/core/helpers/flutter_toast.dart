import 'package:fintech_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FlutterToast {
  static Future<bool?> showFlutterToast({
    required String message,
    required ToastStates state,
    required BuildContext context,
  }) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: _choseToastStateColor(state),
      textColor: isDarkMode ? AppColors.snowWhite : AppColors.primary,
      fontSize: 16.0,
    );
  }
}

enum ToastStates {
  success,
  error,
  warning,
}

Color _choseToastStateColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.success:
      color = AppColors.successGreen;
      break;
    case ToastStates.warning:
      color = AppColors.alertOrange;
      break;
    case ToastStates.error:
      color = AppColors.redColor;
      break;
  }
  return color;
}
