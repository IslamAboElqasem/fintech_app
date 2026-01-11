import 'package:fintech_app/core/helpers/extension.dart';
import 'package:fintech_app/features/home/data/models/global_data_response.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'market_overview_item.dart';

class MarketOverviewGrid extends StatelessWidget {
  const MarketOverviewGrid({super.key, this.globalMarketData});
  final GlobalMarketData? globalMarketData;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 12.h,
      crossAxisSpacing: 12.w,
      childAspectRatio: 1.7,
      children: [
        MarketOverviewItem(
          label: 'Market Cap',
          value: (globalMarketData?.totalMarketCap?['usd'] ?? 0.0).toCompact(),
          percentage: globalMarketData?.marketCapChangePercentage24hUsd,
        ),
        MarketOverviewItem(
          label: '24h Volume',
          value: (globalMarketData?.totalVolume?['usd'] ?? 0.0).toCompact(),
          percentage: globalMarketData?.marketCapChangePercentage24hUsd,
        ),
        MarketOverviewItem(
          label: 'BTC Dominance',
          value:
              '${(globalMarketData?.marketCapPercentage?['btc'] ?? 0).toStringAsFixed(2)}%',
        ),
        MarketOverviewItem(
          label: 'Active Coins',
          value: globalMarketData?.activeCryptocurrencies.toString(),
        ),
      ],
    );
  }
}
