import 'package:fintech_app/features/coin_details/data/model/coin_details_model.dart';
import 'package:fintech_app/features/market/data/models/coin_overview_model.dart';

extension CoinOverviewModelExtension on CoinOverviewModel {
  /// Converts CoinOverviewModel to CoinDetailsModel for display purposes
  CoinDetailsModel toCoinDetailsModel() {
    return CoinDetailsModel(
      id: coinId,
      symbol: symbol,
      name: coinName,
      description: const {}, // Empty description for overview items
      image: Image(
        thumb: coinImage,
        small: coinImage,
        large: coinImage,
      ),
      marketData: MarketData(
        currentPrice: {'usd': currentPrice},
        priceChangePercentage24h: priceChangePercentage24h,
        marketCap: null,
        totalVolume: null,
        totalSupply: null,
        maxSupply: null,
        circulatingSupply: null,
        priceChange24h: null,
      ),
    );
  }
}
