import 'package:fintech_app/features/home/data/models/trending_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // 1. Test the main TrendingResponse class
  group('TrendingResponse', () {
    test('fromJson parses correctly', () {
      final json = {
        'coins': [
          {
            'item': {'name': 'BTC'},
          },
        ],
      };
      final response = TrendingResponse.fromJson(json);
      expect(response.coins, isNotEmpty);
    });

    test('mock factory creates populated instance', () {
      final mock = TrendingResponse.mock();
      expect(mock.coins?.length, 5);
      expect(mock.coins?.first, isA<CoinWrapper>());
    });
  });

  group('CoinWrapper', () {
    test('fromJson parses correctly', () {
      final json = {
        'item': {'name': 'ETH'},
      };
      final wrapper = CoinWrapper.fromJson(json);
      expect(wrapper.item?.name, 'ETH');
    });

    test('mock factory works', () {
      final mock = CoinWrapper.mock();
      expect(mock.item, isA<CoinItem>());
    });
  });

  group('CoinItem', () {
    test('fromJson parses correctly including @JsonKey', () {
      final json = {
        'name': 'Litecoin',
        'symbol': 'LTC',
        'small': 'img_url',
        'data': {'price': 50.0},
      };
      final item = CoinItem.fromJson(json);
      expect(item.image, 'img_url');
      expect(item.name, 'Litecoin');
    });

    test('mock factory works', () {
      final mock = CoinItem.mock();
      expect(mock.name, 'Bitcoin Placeholder');
      expect(mock.data, isA<CoinData>());
    });
  });

  group('CoinData', () {
    test('fromJson parses correctly including nested maps', () {
      final json = {
        'price': 100.0,
        'price_change_percentage_24h': {'usd': 1.5},
      };
      final data = CoinData.fromJson(json);
      expect(data.price, 100.0);
      expect(data.changePercentage?['usd'], 1.5);
    });

    test('Constructor allows nulls', () {
      const data = CoinData(price: null, changePercentage: null);
      expect(data.price, isNull);
    });
  });
}
