import 'package:fintech_app/features/home/data/models/coin_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(' Coin Model', () {
    test('fromJson parses correctly when data is present', () {
      final json = {
        'id': 'bitcoin',
        'symbol': 'BTC',
        'current_price': 45000.0,
      };

      final response = CoinModel.fromJson(json);

      expect(response, isA<CoinModel>());
      expect(response.id, 'bitcoin');
      expect(response.symbol, 'BTC');
      expect(response.currentPrice, 45000.0);
    });
  });
}
