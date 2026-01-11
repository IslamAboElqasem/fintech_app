import 'package:fintech_app/core/theme/app_color.dart';
import 'package:fintech_app/core/theme/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBackgroundImage extends StatelessWidget {
  const CustomBackgroundImage({
    super.key,
    this.height = 300,
    this.width = 300,
    this.alignment = Alignment.topRight,
    this.imagePath,
  });

  final double height;
  final double width;
  final Alignment alignment;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      height: height.h,
      child: Align(
        alignment: alignment,
        child: Image.asset(
          AppImages.shadowBackgroundIamge,
          width: width.w,
          fit: BoxFit.contain,
          color: isDarkMode ? AppColors.snowWhite : AppColors.primary,
        ),
      ),
    );
  }
}
