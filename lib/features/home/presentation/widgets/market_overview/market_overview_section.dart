import 'package:fintech_app/core/helpers/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'market_overview_bloc_builder.dart';

class MarketOverviewSection extends StatelessWidget {
  const MarketOverviewSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Market Overview',
            style: context.headlineMedium_18,
          ),
          16.verticalSpace,
          const MarketOverviewBlocBuilder(),
        ],
      ),
    );
  }
}
