import 'package:fintech_app/core/theme/app_color.dart';
import 'package:fintech_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ButtonType { filled, outlined }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonType type;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double? width;
  final double? height;
  final double borderRadius;
  final double borderWidth;
  final TextStyle? textStyle;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = ButtonType.filled,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.width,
    this.height,
    this.borderRadius = 30,
    this.borderWidth = 2,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final defaultBgColor = type == ButtonType.filled
        ? (backgroundColor ??
              (isDarkMode ? AppColors.snowWhite : AppColors.primary))
        : (backgroundColor ??
              (isDarkMode ? AppColors.blackColor : AppColors.snowWhite));

    final defaultTextColor = type == ButtonType.filled
        ? (textColor ??
              (isDarkMode ? AppColors.blackColor : AppColors.snowWhite))
        : (textColor ?? (isDarkMode ? AppColors.snowWhite : AppColors.primary));

    return SizedBox(
      width: width,
      height: height ?? 60.h,
      child: Material(
        color: defaultBgColor,
        borderRadius: BorderRadius.circular(borderRadius.r),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(borderRadius.r),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color:
                    borderColor ??
                    (isDarkMode ? AppColors.snowWhite : AppColors.primary),
                width: borderWidth.w,
              ),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Center(
              child: Text(
                text,
                style:
                    textStyle ??
                    (type == ButtonType.filled
                        ? TextStyles.font18SnowWhiteBold.copyWith(
                            color: defaultTextColor,
                          )
                        : TextStyles.font18PrimaryBold.copyWith(
                            color: defaultTextColor,
                          )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
