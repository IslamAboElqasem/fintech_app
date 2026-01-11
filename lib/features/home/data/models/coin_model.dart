import 'package:hive_ce/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coin_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable(createToJson: false)
class CoinModel {
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String? name;

  @HiveField(2)
  final String? symbol;

  @HiveField(3)
  final String? image;

  @HiveField(4)
  @JsonKey(name: 'current_price', fromJson: _toDouble)
  final double? currentPrice;

  @HiveField(5)
  @JsonKey(name: 'price_change_percentage_24h', fromJson: _toDouble)
  final double? priceChangePercentage24h;

  const CoinModel({
    required this.id,
    required this.name,
    required this.symbol,
    required this.image,
    required this.currentPrice,
    this.priceChangePercentage24h,
  });

  factory CoinModel.fromJson(Map<String, dynamic> json) =>
      _$CoinModelFromJson(json);

  factory CoinModel.mock() => const CoinModel(
    id: 'bitcoin',
    name: 'Bitcoin Placeholder',
    symbol: 'BTC',
    image: '',
    currentPrice: 45000.0,
    priceChangePercentage24h: 5.25,
  );

  static double _toDouble(dynamic value) {
    if (value is int) return value.toDouble();
    return (value as double?) ?? 0.0;
  }
}
