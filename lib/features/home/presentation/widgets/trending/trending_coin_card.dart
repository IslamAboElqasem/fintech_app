import 'package:cached_network_image/cached_network_image.dart';
import 'package:fintech_app/core/helpers/app_regex.dart';
import 'package:fintech_app/core/helpers/extension.dart';
import 'package:fintech_app/features/home/data/models/trending_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_color.dart';

class TrendingCoinCard extends StatelessWidget {
  final CoinWrapper? coins;

  const TrendingCoinCard({super.key, required this.coins});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.brightnessOf(context) == Brightness.dark;
    final double isPositive = coins?.item?.data?.changePercentage?['btc']??0;

    return Container(
      width: 192.w,

      margin: EdgeInsets.only(right: 12.w),
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 8.h,
      ),
      decoration: BoxDecoration(
        color: isDark ? AppColors.blackColor : Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                coins?.item?.name?.split(' ').first ?? '',
                style: context.labelMedium_14,
              ),
              const Spacer(),
              CachedNetworkImage(
                imageUrl: coins?.item?.image ?? '',
                fit: BoxFit.contain,
                width: 24.w,
                height: 24.h,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ],
          ),
          Text(
            coins?.item?.symbol ?? '',
            style: context.bodySmall_12,
          ),
          16.verticalSpace,
          Row(
            children: [
              Text(
                AppRegex.formatWithCommas(
                  coins?.item?.data?.price?.round() ?? 0,
                ),
                style: context.displaySmall_20,
              ),
              const Spacer(),
              Text(
                '${coins?.item?.data?.changePercentage?['btc']?.toStringAsFixed(2)}%',
                style: context.bodySmall_12?.copyWith(
                  color: isPositive > 0
                      ? AppColors.electricBlue
                      : AppColors.errorRed,
                ),
              ),
              2.horizontalSpace,
              Icon(
                isPositive > 0 ? Icons.arrow_upward : Icons.arrow_downward,
                color: isPositive > 0
                    ? AppColors.electricBlue
                    : AppColors.errorRed,
                size: 10.r,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
