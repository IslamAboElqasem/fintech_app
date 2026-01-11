// ignore_for_file: deprecated_member_use

import 'package:fintech_app/core/theme/app_color.dart';
import 'package:fintech_app/core/widgets/custom_loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isEnabled;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? disabledBackgroundColor;
  final Color? loadingIndicatorColor;
  final double? width;
  final double? height;
  final double borderRadius;
  final TextStyle? textStyle;
  final double? loadingSize;
  final EdgeInsetsGeometry? padding;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.backgroundColor,
    this.textColor,
    this.disabledBackgroundColor,
    this.loadingIndicatorColor,
    this.width,
    this.height,
    this.borderRadius = 28,
    this.textStyle,
    this.loadingSize,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final bool canPress = isEnabled && !isLoading;

    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 56.h,
      child: ElevatedButton(
        onPressed: canPress ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primary,
          disabledBackgroundColor:
              disabledBackgroundColor ??
              (backgroundColor ?? AppColors.primary).withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
          ),
          elevation: 0,
          padding: padding,
        ),
        child: isLoading
            ? SizedBox(
                height: loadingSize ?? 24.h,
                width: loadingSize ?? 24.w,
                child: const CustomLoadingDialog(size: 20),
              )
            : Text(
                text,
                style:
                    textStyle ??
                    TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: textColor ?? Colors.white,
                    ),
              ),
      ),
    );
  }
}
