import 'package:fintech_app/core/icons/my_flutter_app_icons.dart';
import 'package:fintech_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class NextArrowButton extends StatelessWidget {
  const NextArrowButton({
    super.key,
    required this.isDarkMode,
  });

  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 32,
      backgroundColor: isDarkMode ? AppColors.snowWhite : AppColors.primary,
      child: Icon(
        MyFlutterApp.arrowiconlightmode,
        size: 48,
        color: isDarkMode ? AppColors.blackColor : AppColors.snowWhite,
      ),
    );
  }
}
