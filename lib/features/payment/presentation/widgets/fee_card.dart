import 'package:fintech_app/core/theme/app_color.dart';
import 'package:fintech_app/core/theme/app_images.dart';
import 'package:fintech_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeeCard extends StatelessWidget {
  final double fee;

  const FeeCard({super.key, required this.fee});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 217.w,
          height: 80.h,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.snowWhite,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: AppColors.alertOrange,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Image(
                  image: const AssetImage(AppImages.dollarCircleImage),
                  width: 24.w,
                  height: 24.h,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Exchange fee',
                      style: TextStyles.font12StoneGrayMeduim,
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      '0.05%',
                      style: TextStyles.font16PrimarySemiBold,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Container(
          width: 96.w,
          height: 80.h,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.snowWhite,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                '\$${fee.toStringAsFixed(1)}',
                style: TextStyles.font20PrimaryBold,
                maxLines: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
