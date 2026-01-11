import 'package:fintech_app/core/helpers/extension.dart';
import 'package:fintech_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarketOverviewItem extends StatelessWidget {
  final String label;
  final String? value;
  final double? percentage;

  const MarketOverviewItem({
    super.key,
    required this.label,
    required this.value,
    this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.brightnessOf(context) == Brightness.dark;
    return Container(
      height: 94.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: isDark ? AppColors.blackColor : Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: context.labelMedium_14,
          ),
          8.verticalSpace,
          Text(
            value ?? '',
            style: context.displaySmall_20,
          ),
          if (percentage != null) ...[
            4.verticalSpace,
            Row(
              children: [
                Text(
                  '${percentage?.toStringAsFixed(2)}%',
                  style: context.bodySmall_12?.copyWith(
                    color: (percentage ?? 0) > 0
                        ? AppColors.lavenderPurple
                        : Colors.red,
                  ),
                ),
                Icon(
                  (percentage ?? 0) > 0
                      ? Icons.arrow_drop_up
                      : Icons.arrow_drop_down,
                  color: (percentage ?? 0) > 0
                      ? AppColors.lavenderPurple
                      : Colors.red,
                  size: 10,
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
