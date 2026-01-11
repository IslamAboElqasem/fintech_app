import 'package:fintech_app/core/theme/app_color.dart';
import 'package:fintech_app/core/theme/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwapButton extends StatelessWidget {
  final VoidCallback onSwap;

  const SwapButton({super.key, required this.onSwap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: AppColors.smokeGray)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: GestureDetector(
            onTap: onSwap,
            child: Image(
              image: const AssetImage(AppImages.swapImage),
              width: 36.w,
              height: 36.h,
            ),
          ),
        ),
        const Expanded(child: Divider(color: AppColors.smokeGray)),
      ],
    );
  }
}
