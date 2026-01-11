import 'package:fintech_app/core/icons/my_flutter_app_icons.dart';
import 'package:fintech_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BiometricLoginButtons extends StatelessWidget {
  const BiometricLoginButtons({
    super.key,
    this.onFingerprintTap,
    this.onFaceIdTap,
    this.iconSize = 48,
  });

  final void Function()? onFingerprintTap;
  final void Function()? onFaceIdTap;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: Icon(
            MyFlutterApp.fingerprinticon,
            color: isDarkMode ? AppColors.snowWhite : AppColors.lighterGray,
            size: iconSize.sp,
          ),
          onPressed: onFingerprintTap,
        ),
        IconButton(
          icon: Icon(
            MyFlutterApp.faceidicon,
            color: isDarkMode ? AppColors.snowWhite : AppColors.lighterGray,
            size: iconSize.sp,
          ),
          onPressed: onFaceIdTap,
        ),
      ],
    );
  }
}
