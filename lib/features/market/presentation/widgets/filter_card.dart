// ignore_for_file: must_be_immutable

import 'package:fintech_app/core/theme/app_color.dart';
import 'package:fintech_app/core/theme/text_styles.dart';
import 'package:fintech_app/features/market/domain/filter_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterCard extends StatelessWidget {
  FilterCard({required this.filterEntity, required this.isSelected, super.key});
  FilterEntity filterEntity;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(9.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.r),
        color: isSelected ? AppColors.twilightPurple : AppColors.snowWhite,
      ),
      child: Text(
        filterEntity.filterName,
        style: isSelected
            ? TextStyles.font16SnowWhiteRegular
            : TextStyles.font16OnboardingBlackRegular,
      ),
    );
  }
}
