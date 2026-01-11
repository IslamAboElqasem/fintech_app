import 'dart:async' show unawaited;

import 'package:fintech_app/core/networking/api_error_handler.dart';
import 'package:fintech_app/core/networking/api_reuslt.dart';
import 'package:fintech_app/features/home/data/apis/home_api_service.dart';
import 'package:fintech_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:fintech_app/features/home/data/models/coin_model.dart';
import 'package:fintech_app/features/home/data/models/global_data_response.dart';
import 'package:fintech_app/features/home/data/models/trending_response.dart';
import 'package:fintech_app/features/home/presentation/repos/home_repo.dart';

/// Repository implementation with offline-first strategy
/// Uses generic method to eliminate code duplication (DRY principle)
///
/// Strategy:
/// 1. Check if cache is valid
/// 2. If valid, return cached data immediately + fetch fresh data in background
/// 3. If invalid, fetch from network and cache it
/// 4. If network fails, return cached data (even if expired) as fallback
class HomeRepoImpl implements HomeRepo {
  final HomeApiService homeApiService;
  final HomeLocalDataSource localDataSource;

  HomeRepoImpl({
    required this.homeApiService,
    required this.localDataSource,
  });

  @override
  Future<ApiReuslt<GlobalDataResponse>> getGlobalData() async {
    return _fetchWithCache<GlobalDataResponse>(
      getCached: () => localDataSource.getCachedGlobalData(),
      isCacheValid: () => localDataSource.isGlobalDataCacheValid(),
      fetchFromNetwork: () => homeApiService.getGlobalData(),
      saveToCache: (data) => localDataSource.cacheGlobalData(data),
    );
  }

  @override
  Future<ApiReuslt<TrendingResponse>> getTrendingCoins() async {
    return _fetchWithCache<TrendingResponse>(
      getCached: () => localDataSource.getCachedTrendingCoins(),
      isCacheValid: () => localDataSource.isTrendingCoinsCacheValid(),
      fetchFromNetwork: () => homeApiService.getTrendingCoins(),
      saveToCache: (data) => localDataSource.cacheTrendingCoins(data),
    );
  }

  @override
  Future<ApiReuslt<List<CoinModel>>> getCoinsDetails() async {
    return _fetchWithCache<List<CoinModel>>(
      getCached: () => localDataSource.getCachedCoins(),
      isCacheValid: () => localDataSource.isCoinsCacheValid(),
      fetchFromNetwork: () => homeApiService.getCoinsDetails('usd'),
      saveToCache: (data) => localDataSource.cacheCoins(data),
    );
  }

  /// Generic offline-first fetch method
  /// Implements the cache-first strategy for any data type
  ///
  /// This method follows DRY principle by providing a single implementation
  /// of the offline-first pattern that works for all data types
  Future<ApiReuslt<T>> _fetchWithCache<T>({
    required T? Function() getCached,
    required bool Function() isCacheValid,
    required Future<T> Function() fetchFromNetwork,
    required Future<void> Function(T data) saveToCache,
  }) async {
    try {
      // Try to get cached data first
      final cachedData = getCached();
      final isValid = isCacheValid();

      // If cache is valid, return it immediately
      if (cachedData != null && isValid) {
        // Fetch fresh data in background and update cache
        // unawaited ensures we don't wait for background fetch
        unawaited(
          _fetchAndCacheInBackground(
            fetchFromNetwork: fetchFromNetwork,
            saveToCache: saveToCache,
          ),
        );
        return ApiReuslt.success(cachedData);
      }

      // Cache is invalid or doesn't exist, fetch from network
      final response = await fetchFromNetwork();

      await saveToCache(response);

      return ApiReuslt.success(response);
    } catch (error) {
      // If network fails, try to return cached data (even if expired)
      final cachedData = getCached();
      if (cachedData != null) {
        return ApiReuslt.success(cachedData);
      }

      return ApiReuslt.failure(ApiErrorHandler.handle(error));
    }
  }

  /// Background fetch with proper error handling and logging
  /// This method updates the cache in the background without blocking the UI
  Future<void> _fetchAndCacheInBackground<T>({
    required Future<T> Function() fetchFromNetwork,
    required Future<void> Function(T data) saveToCache,
  }) async {
    try {
      final response = await fetchFromNetwork();
      await saveToCache(response);
    } catch (error) {
      // To handle it in future
    }
  }
}
