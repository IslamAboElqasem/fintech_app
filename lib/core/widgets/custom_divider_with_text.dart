import 'package:fintech_app/core/theme/app_color.dart';
import 'package:fintech_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDividerWithText extends StatelessWidget {
  const CustomDividerWithText({
    super.key,
    required this.text,
    this.textStyle,
    this.dividerColor,
    this.horizontalPadding = 16,
  });

  final String text;
  final TextStyle? textStyle;
  final Color? dividerColor;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Row(
      children: [
        Expanded(
          child: Divider(
            color:
                dividerColor ??
                (isDarkMode ? AppColors.lighterGray : AppColors.lightGray),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w),
          child: Text(
            text,
            style:
                textStyle ??
                (isDarkMode
                    ? TextStyles.font14SnowWhiteSemiBold
                    : TextStyles.font14PrimarySemiBold),
          ),
        ),
        Expanded(
          child: Divider(
            color:
                dividerColor ??
                (isDarkMode ? AppColors.lighterGray : AppColors.lightGray),
          ),
        ),
      ],
    );
  }
}
