import 'package:fintech_app/core/theme/app_color.dart';
import 'package:fintech_app/core/theme/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodChips extends StatefulWidget {
  const PaymentMethodChips({super.key});

  @override
  State<PaymentMethodChips> createState() => _PaymentMethodChipsState();
}

class _PaymentMethodChipsState extends State<PaymentMethodChips> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildChip(AppImages.visaImage),
        SizedBox(width: 12.w),
        _buildChip(AppImages.masterCardImage),
        SizedBox(width: 12.w),
        _buildChip(AppImages.applePayImage),
      ],
    );
  }

  Widget _buildChip(String image) {
    return Expanded(
      child: GestureDetector(
        child: Container(
          height: 36.h,
          padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 7.h),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Image(
            image: AssetImage(image),
            width: 45.w,
            height: 14.h,
          ),
        ),
      ),
    );
  }
}
