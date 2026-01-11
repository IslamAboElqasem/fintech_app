import 'package:fintech_app/features/home/data/models/coin_model.dart';
import 'package:fintech_app/features/home/data/models/global_data_response.dart';
import 'package:fintech_app/features/home/data/models/trending_response.dart';

/// Abstract interface for home feature local data source
/// Defines contract for caching operations
abstract class HomeLocalDataSource {
  /// Get cached global market data
  GlobalDataResponse? getCachedGlobalData();

  /// Cache global market data
  Future<void> cacheGlobalData(GlobalDataResponse data);

  /// Get cached trending coins
  TrendingResponse? getCachedTrendingCoins();

  /// Cache trending coins
  Future<void> cacheTrendingCoins(TrendingResponse data);

  /// Get cached coins details
  List<CoinModel>? getCachedCoins();

  /// Cache coins details
  Future<void> cacheCoins(List<CoinModel> coins);

  /// Clear all cached home data
  Future<void> clearCache();

  /// Check if global data cache is valid
  bool isGlobalDataCacheValid();

  /// Check if trending coins cache is valid
  bool isTrendingCoinsCacheValid();

  /// Check if coins cache is valid
  bool isCoinsCacheValid();
}
