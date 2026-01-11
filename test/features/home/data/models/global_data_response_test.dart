import 'package:flutter_test/flutter_test.dart';
import 'package:fintech_app/features/home/data/models/global_data_response.dart'; 

void main() {
  group('GlobalDataResponse', () {
    test('fromJson parses correctly when data is present', () {
      final json = {
        'data': {
          'active_cryptocurrencies': 10,
        }
      };

      final response = GlobalDataResponse.fromJson(json);

      expect(response, isA<GlobalDataResponse>());
      expect(response.data, isA<GlobalMarketData>());
      expect(response.data?.activeCryptocurrencies, 10);
    });

    test('fromJson handles null data', () {
      final json = <String, dynamic>{}; // No 'data' key

      final response = GlobalDataResponse.fromJson(json);

      expect(response.data, isNull);
    });
  });

  group('GlobalMarketData', () {
    test('fromJson maps all snake_case fields to camelCase properties', () {
      // We manually construct a map that matches the @JsonKey names
      final json = {
        'active_cryptocurrencies': 100,
        'upcoming_icos': 5,
        'ongoing_icos': 2,
        'ended_icos': 10,
        'markets': 50,
        'total_market_cap': {'usd': 100000.0},
        'total_volume': {'usd': 50000.0},
        'market_cap_percentage': {'btc': 45.5},
        'market_cap_change_percentage_24h_usd': -1.2,
        'updated_at': 163000000,
      };

      final data = GlobalMarketData.fromJson(json);

      // Assertions to verify the Generated Code logic
      expect(data.activeCryptocurrencies, 100);
      expect(data.upcomingIcos, 5);
      expect(data.ongoingIcos, 2);
      expect(data.endedIcos, 10);
      expect(data.markets, 50);
      expect(data.totalMarketCap?['usd'], 100000.0);
      expect(data.totalVolume?['usd'], 50000.0);
      expect(data.marketCapPercentage?['btc'], 45.5);
      expect(data.marketCapChangePercentage24hUsd, -1.2);
      expect(data.updatedAt, 163000000);
    });

    // CRITICAL: You must call this to cover lines 42-53 in your model
    test('mock factory returns the specific hardcoded values', () {
      final data = GlobalMarketData.mock();

      expect(data.activeCryptocurrencies, 12345);
      expect(data.upcomingIcos, 0);
      expect(data.totalMarketCap?['usd'], 1234567890000.0);
      expect(data.marketCapChangePercentage24hUsd, 2.5);
      expect(data.updatedAt, 0);
    });
  });
}