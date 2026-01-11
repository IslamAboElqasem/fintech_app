import 'package:hive_ce_flutter/hive_flutter.dart';

/// Helper class for managing Hive cache operations
/// Generic implementation that doesn't depend on specific models
class CacheHelper {
  static late Box _box;

  /// Initialize Hive box
  /// Note: Adapters must be registered BEFORE calling this
  static Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox('cacheBox');
  }

  /// Save data to cache
  static Future<void> saveData({
    required String key,
    required dynamic value,
  }) async {
    await _box.put(key, value);
  }

  /// Get data from cache with type safety
  static T? getData<T>(String key, {T? defaultValue}) {
    try {
      final value = _box.get(key, defaultValue: defaultValue);
      return value as T?;
    } catch (e) {
      return defaultValue;
    }
  }

  /// Check if key exists
  static bool contains(String key) {
    return _box.containsKey(key);
  }

  /// Remove single cached item
  static Future<void> remove(String key) async {
    await _box.delete(key);
  }

  /// Remove multiple keys at once (batch operation)
  static Future<void> removeMultiple(List<String> keys) async {
    await _box.deleteAll(keys);
  }

  /// Clear all cached data
  static Future<void> clear() async {
    await _box.clear();
  }

  /// Check if cached data is still valid based on timestamp
  static bool isCacheValid(String timestampKey, Duration expirationDuration) {
    if (!contains(timestampKey)) return false;

    final timestamp = getData<int>(timestampKey);
    if (timestamp == null) return false;

    final cachedTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    final now = DateTime.now();
    final difference = now.difference(cachedTime);

    return difference < expirationDuration;
  }

  /// Save data with timestamp for expiration tracking
  static Future<void> saveDataWithTimestamp({
    required String dataKey,
    required String timestampKey,
    required dynamic value,
  }) async {
    // Use batch operation for better performance
    await Future.wait([
      saveData(key: dataKey, value: value),
      saveData(
        key: timestampKey,
        value: DateTime.now().millisecondsSinceEpoch,
      ),
    ]);
  }
}
