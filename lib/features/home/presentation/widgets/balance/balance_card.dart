import 'package:fintech_app/core/helpers/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_color.dart';
import 'custom_gradient_card.dart';
import 'weekly_profit_pill.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.cardGradient,
      ),
      child: Stack(
        children: [
          CustomGradientCard(
            top: -60.h,
            right: -60.w,
            width: 110.w,
            height: 110.h,
            opacity: .1,
          ),
          CustomGradientCard(
            top: -60.h,
            right: -60.w,
            width: 123.w,
            height: 120.h,
            opacity: .1,
          ),
          CustomGradientCard(
            top: -60.h,
            right: -60.w,
            width: 133.w,
            height: 130.h,
            opacity: .1,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16.0.h,
                horizontal: 12.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Current Balance',
                    style: context.bodyMedium_14?.copyWith(
                      color: AppColors.cloudWhite,
                    ),
                  ),
                  8.verticalSpace,
                  Text(
                    '\$143,421.12',
                    style: context.displayMedium_28?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  8.verticalSpace,
                  const WeeklyProfitPill(percentage: 2.53),
                ],
              ),
            ),
          ),
          CustomGradientCard(
            bottom: -60.h,
            left: -60.w,
            width: 130.w,
            height: 130.h,
            opacity: .1,
          ),
          CustomGradientCard(
            bottom: -60.h,
            left: -60.w,
            width: 145.w,
            height: 145.h,
            opacity: .1,
          ),
          CustomGradientCard(
            bottom: -60.h,
            left: -60.w,
            width: 165.w,
            height: 165.h,
            opacity: .1,
          ),
        ],
      ),
    );
  }
}
