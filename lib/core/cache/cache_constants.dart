/// Cache constants for managing local storage keys and configurations
class CacheConstants {
  CacheConstants._();

  // Box name
  static const String cacheBoxName = 'cacheBox';

  // Cache keys for home feature
  static const String homeGlobalDataKey = 'home_global_data';
  static const String homeGlobalDataTimestampKey = 'home_global_data_timestamp';

  static const String homeTrendingCoinsKey = 'home_trending_coins';
  static const String homeTrendingCoinsTimestampKey =
      'home_trending_coins_timestamp';

  static const String homeCoinsDetailsKey = 'home_coins_details';
  static const String homeCoinsDetailsTimestampKey =
      'home_coins_details_timestamp';

  // Cache expiration duration (5 minutes)
  static const Duration cacheExpirationDuration = Duration(minutes: 5);
}
