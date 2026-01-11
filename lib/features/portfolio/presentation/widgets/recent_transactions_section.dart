import 'package:fintech_app/core/helpers/extension.dart';
import 'package:fintech_app/core/theme/app_color.dart';
import 'package:fintech_app/core/theme/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentTransactionsSection extends StatelessWidget {
  const RecentTransactionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Transactions',
          style: context.headlineMedium_18?.copyWith(
            fontWeight: FontWeightHelper.bold,
          ),
        ),
        16.verticalSpace,
        const _TransactionItem(
          type: 'Buy Bitcoin',
          timeAgo: '2 hours ago',
          amount: '0.01 BTC',
          value: '-\$452.50',
          isPositive: true,
          isBuy: true,
        ),
        12.verticalSpace,
        const _TransactionItem(
          type: 'Sell Ethereum',
          timeAgo: '1 day ago',
          amount: '0.5 ETH',
          value: '+\$1,050.25',
          isPositive: true,
          isBuy: false,
        ),
      ],
    );
  }
}

class _TransactionItem extends StatelessWidget {
  final String type;
  final String timeAgo;
  final String amount;
  final String value;
  final bool isPositive;
  final bool isBuy;

  const _TransactionItem({
    required this.type,
    required this.timeAgo,
    required this.amount,
    required this.value,
    required this.isPositive,
    required this.isBuy,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: isBuy
                  ? AppColors.successGreen.withOpacity(0.1)
                  : AppColors.coralPink.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isBuy ? Icons.arrow_upward : Icons.arrow_downward,
              color: isBuy ? AppColors.successGreen : AppColors.coralPink,
              size: 20.sp,
            ),
          ),
          12.horizontalSpace,
          // Transaction info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  type,
                  style: context.bodyLarge_16?.copyWith(
                    fontWeight: FontWeightHelper.medium,
                    color: AppColors.primary,
                  ),
                ),
                4.verticalSpace,
                Text(
                  timeAgo,
                  style: context.bodySmall_12?.copyWith(
                    color: AppColors.stormGray,
                  ),
                ),
              ],
            ),
          ),
          // Amount and value
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: context.bodyLarge_16?.copyWith(
                  fontWeight: FontWeightHelper.medium,
                  color: AppColors.primary,
                ),
              ),
              4.verticalSpace,
              Text(
                value,
                style: context.bodySmall_12?.copyWith(
                  color: AppColors.successGreen,
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
