import 'package:fintech_app/core/theme/app_color.dart';
import 'package:fintech_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onTap,
    required this.isDarkMode,
    required this.text,
    this.style,
  });

  final void Function()? onTap;
  final bool isDarkMode;
  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        text,
        style:
            style ??
            TextStyles.font20PrimaryRegular.copyWith(
              color: isDarkMode ? AppColors.snowWhite : AppColors.primary,
            ),
      ),
    );
  }
}
