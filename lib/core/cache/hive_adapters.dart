import 'package:fintech_app/features/home/data/models/coin_model.dart';
import 'package:fintech_app/features/home/data/models/global_data_response.dart';
import 'package:fintech_app/features/home/data/models/trending_response.dart';
import 'package:fintech_app/features/portfolio/data/models/user_holding_model.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

/// Class for registering Hive type adapters
/// Separated from CacheHelper to follow Single Responsibility Principle
class HiveAdapters {
  /// Private constructor to prevent instantiation
  HiveAdapters._();

  /// Register all type adapters for the application
  static void registerAdapters() {
    // Register each adapter with explicit type parameter
    // This prevents the "dynamic type" warning and ensures proper type safety
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter<CoinModel>(CoinModelAdapter());
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter<TrendingResponse>(TrendingResponseAdapter());
    }
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter<CoinWrapper>(CoinWrapperAdapter());
    }
    if (!Hive.isAdapterRegistered(3)) {
      Hive.registerAdapter<CoinItem>(CoinItemAdapter());
    }
    if (!Hive.isAdapterRegistered(4)) {
      Hive.registerAdapter<CoinData>(CoinDataAdapter());
    }
    if (!Hive.isAdapterRegistered(5)) {
      Hive.registerAdapter<GlobalDataResponse>(GlobalDataResponseAdapter());
    }
    if (!Hive.isAdapterRegistered(6)) {
      Hive.registerAdapter<GlobalMarketData>(GlobalMarketDataAdapter());
    }
    if (!Hive.isAdapterRegistered(7)) {
      Hive.registerAdapter<UserHoldingModel>(UserHoldingModelAdapter());
    }
  }
}
