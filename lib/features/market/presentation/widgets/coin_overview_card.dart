import 'package:fintech_app/core/theme/app_color.dart';
import 'package:fintech_app/core/theme/text_styles.dart';
import 'package:fintech_app/features/coin_details/data/model/coin_details_model.dart'
    hide Image;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoinOverviewCard extends StatelessWidget {
  const CoinOverviewCard({required this.coin, super.key});
  final CoinDetailsModel coin;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.snowWhite,
        borderRadius: BorderRadius.circular(10.sp),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          Container(
            width: 52.sp,
            height: 52.sp,
            decoration: BoxDecoration(
              color: AppColors.silverWhite,
              borderRadius: BorderRadius.circular(10.sp),
            ),
            child: Padding(
              padding: EdgeInsets.all(6.sp),
              child: Image.network(coin.image?.thumb ?? ""),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coin.name!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.font18DeepForestBold,
                ),
                SizedBox(height: 4.h),
                Text(
                  coin.symbol?.toUpperCase() ?? "",
                  style: TextStyles.font16MediumGrayRegular,
                ),
              ],
            ),
          ),

          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${coin.marketData?.currentPrice?['usd']?.toStringAsFixed(2) ?? '0.00'}",
                style: TextStyles.font18DeepForestBold,
              ),
              performanceInfo(coin.marketData!.priceChangePercentage24h!),
            ],
          ),
        ],
      ),
    );
  }

  Widget performanceInfo(double priceChangePercentage24h) {
    if (priceChangePercentage24h >= 0) {
      return Container(
        padding: EdgeInsets.all(5.sp),

        decoration: BoxDecoration(
          color: AppColors.successGreen,
          borderRadius: BorderRadius.circular(8.sp),
        ),
        child: Row(
          children: [
            Transform.rotate(
              angle: 3.14 / 4,
              child: Icon(
                Icons.arrow_upward,
                color: AppColors.snowWhite,
                size: 16.sp,
              ),
            ),
            SizedBox(width: 4.w),
            Text(
              "${priceChangePercentage24h.toStringAsFixed(1)}%",
              style: TextStyles.font10SnowWhitekBold,
            ),
          ],
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.all(5.sp),
        decoration: BoxDecoration(
          color: AppColors.redColor,
          borderRadius: BorderRadius.circular(8.sp),
        ),
        child: Row(
          children: [
            Transform.rotate(
              angle: 0.5,
              child: Icon(
                Icons.arrow_downward,
                color: AppColors.snowWhite,
                size: 16.sp,
              ),
            ),
            SizedBox(width: 4.w),
            Text(
              "${priceChangePercentage24h.toStringAsFixed(1)}%",
              style: TextStyles.font10SnowWhitekBold,
            ),
          ],
        ),
      );
    }
  }
}
