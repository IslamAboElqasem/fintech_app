import 'package:fintech_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class CustomGradientCard extends StatelessWidget {
  const CustomGradientCard({
    super.key,
    this.top,
    this.bottom,
    this.right,
    this.left,
    this.width,
    this.height,
    this.opacity,
  });
  final double? top;
  final double? bottom;
  final double? right;
  final double? left;
  final double? width;
  final double? height;
  final double? opacity;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.brightnessOf(context) == Brightness.dark;
    return Positioned(
      top: top,
      left: left,
      bottom: bottom,
      right: right,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isDark
              ? AppColors.scaffoldBackGroundDark.withValues(alpha: opacity)
              : AppColors.cloudWhite.withValues(alpha: opacity),
        ),
      ),
    );
  }
}
