import 'package:fintech_app/core/theme/app_color.dart';
import 'package:fintech_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.onTap,
    this.backgroundColor,
    this.hintStyle,
    this.prefixIcon,
    this.borderRadius,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.focusedBorder,
    this.enabledBorder,
    this.suffixIcon,
    this.errorBorder,
    this.onChanged,
    this.isObscureText = false,
    this.controller,
    required this.validator,
  });
  final String hintText;
  final Color? backgroundColor;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? borderRadius;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final bool? isObscureText;
  final void Function() onTap;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String) validator;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextFormField(
      validator: (value) {
        return validator(value!);
      },
      style: isDarkMode
          ? TextStyles.font14CloudWhiteSemiBold
          : TextStyles.font14PrimarySemiBold,
      cursorColor: isDarkMode ? AppColors.snowWhite : AppColors.primary,

      controller: controller,
      onTap: onTap,
      onChanged: onChanged,
      obscureText: isObscureText!,

      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        enabled: true,
        isDense: true,

        fillColor:
            backgroundColor ??
            (isDarkMode ? AppColors.blackColor : AppColors.cloudWhite),
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 18.h,
        ),
        hintStyle: hintStyle ?? TextStyles.font14MediumGrayMeduim,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.darkGray,
            width: 2.w,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
        ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: focusedBorderColor ?? AppColors.primary,
                width: 2.w,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
            ),

        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color:
                    enabledBorderColor ??
                    (isDarkMode ? AppColors.snowWhite : AppColors.darkGray),
                width: 2.w,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
            ),

        errorBorder:
            errorBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: errorBorderColor ?? AppColors.redColor,
                width: 2.w,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
            ),
      ),
    );
  }
}
