import 'package:fintech_app/core/theme/app_color.dart';
import 'package:fintech_app/core/theme/app_images.dart';
import 'package:fintech_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentOptionTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData icon;

  const PaymentOptionTile({
    super.key,
    required this.title,
    required this.onTap,
    this.icon = Icons.arrow_forward_ios,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 15.h),
        decoration: BoxDecoration(
          color: AppColors.snowWhite,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyles.font16PrimarySemiBold),
            Transform.rotate(
              angle: 1.57,
              child: const Image(
                image: AssetImage(AppImages.arrowDownImage),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
