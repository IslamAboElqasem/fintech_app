import 'package:fintech_app/core/cache/cache_constants.dart';
import 'package:fintech_app/core/cache/cache_helper.dart';
import 'package:fintech_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:fintech_app/features/home/data/models/coin_model.dart';
import 'package:fintech_app/features/home/data/models/global_data_response.dart';
import 'package:fintech_app/features/home/data/models/trending_response.dart';

/// Implementation of HomeLocalDataSource using Hive cache
/// Follows best practices: error handling, type safety, and batch operations
class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  GlobalDataResponse? getCachedGlobalData() {
    return CacheHelper.getData<GlobalDataResponse>(
      CacheConstants.homeGlobalDataKey,
    );
  }

  @override
  Future<void> cacheGlobalData(GlobalDataResponse data) async {
    await CacheHelper.saveDataWithTimestamp(
      dataKey: CacheConstants.homeGlobalDataKey,
      timestampKey: CacheConstants.homeGlobalDataTimestampKey,
      value: data,
    );
  }

  @override
  TrendingResponse? getCachedTrendingCoins() {
    return CacheHelper.getData<TrendingResponse>(
      CacheConstants.homeTrendingCoinsKey,
    );
  }

  @override
  Future<void> cacheTrendingCoins(TrendingResponse data) async {
    await CacheHelper.saveDataWithTimestamp(
      dataKey: CacheConstants.homeTrendingCoinsKey,
      timestampKey: CacheConstants.homeTrendingCoinsTimestampKey,
      value: data,
    );
  }

  @override
  List<CoinModel>? getCachedCoins() {
    final cached = CacheHelper.getData<List>(
      CacheConstants.homeCoinsDetailsKey,
    );

    // Type-safe conversion with null safety
    if (cached == null) return null;

    try {
      return cached.cast<CoinModel>();
    } catch (e) {
      
      return null;
    }
  }

  @override
  Future<void> cacheCoins(List<CoinModel> coins) async {
    await CacheHelper.saveDataWithTimestamp(
      dataKey: CacheConstants.homeCoinsDetailsKey,
      timestampKey: CacheConstants.homeCoinsDetailsTimestampKey,
      value: coins,
    );
  }

  @override
  Future<void> clearCache() async {
    // Use batch operation for better performance
    await CacheHelper.removeMultiple([
      CacheConstants.homeGlobalDataKey,
      CacheConstants.homeGlobalDataTimestampKey,
      CacheConstants.homeTrendingCoinsKey,
      CacheConstants.homeTrendingCoinsTimestampKey,
      CacheConstants.homeCoinsDetailsKey,
      CacheConstants.homeCoinsDetailsTimestampKey,
    ]);
  }

  @override
  bool isGlobalDataCacheValid() {
    return CacheHelper.isCacheValid(
      CacheConstants.homeGlobalDataTimestampKey,
      CacheConstants.cacheExpirationDuration,
    );
  }

  @override
  bool isTrendingCoinsCacheValid() {
    return CacheHelper.isCacheValid(
      CacheConstants.homeTrendingCoinsTimestampKey,
      CacheConstants.cacheExpirationDuration,
    );
  }

  @override
  bool isCoinsCacheValid() {
    return CacheHelper.isCacheValid(
      CacheConstants.homeCoinsDetailsTimestampKey,
      CacheConstants.cacheExpirationDuration,
    );
  }
}
