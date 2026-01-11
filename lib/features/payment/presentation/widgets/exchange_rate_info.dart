import 'package:fintech_app/core/theme/app_color.dart';
import 'package:fintech_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExchangeRateInfo extends StatelessWidget {
  final String fromCurrency;
  final String toCurrency;
  final double rate;

  const ExchangeRateInfo({
    super.key,
    required this.fromCurrency,
    required this.toCurrency,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 3.r,
            backgroundColor: AppColors.alertOrange,
          ),
          SizedBox(width: 6.w),
          Text(
            '1 $fromCurrency = ${rate.toStringAsFixed(3)} $toCurrency',
            style: TextStyles.font14SmokeGrayBold,
          ),
        ],
      ),
    );
  }
}
