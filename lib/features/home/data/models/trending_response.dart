import 'package:hive_ce/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'trending_response.g.dart';

@HiveType(typeId: 1)
@JsonSerializable(createToJson: false)
class TrendingResponse {
  @HiveField(0)
  final List<CoinWrapper>? coins;

  const TrendingResponse({this.coins});

  factory TrendingResponse.fromJson(Map<String, dynamic> json) =>
      _$TrendingResponseFromJson(json);

  factory TrendingResponse.mock() => TrendingResponse(
    coins: List.generate(5, (index) => CoinWrapper.mock()),
  );
}

@HiveType(typeId: 2)
@JsonSerializable(createToJson: false)
class CoinWrapper {
  @HiveField(0)
  final CoinItem? item;

  const CoinWrapper({this.item});

  factory CoinWrapper.fromJson(Map<String, dynamic> json) =>
      _$CoinWrapperFromJson(json);

  factory CoinWrapper.mock() => CoinWrapper(item: CoinItem.mock());
}

@HiveType(typeId: 3)
@JsonSerializable(createToJson: false)
class CoinItem {
  @HiveField(0)
  final String? name;

  @HiveField(1)
  final String? symbol;

  @HiveField(2)
  @JsonKey(name: 'small')
  final String? image;

  @HiveField(3)
  final CoinData? data;

  const CoinItem({
    this.name,
    this.symbol,
    this.image,
    this.data,
  });

  factory CoinItem.fromJson(Map<String, dynamic> json) =>
      _$CoinItemFromJson(json);

  factory CoinItem.mock() => const CoinItem(
    name: 'Bitcoin Placeholder',
    symbol: 'BTC',
    image: '',
    data: CoinData(
      price: 45000.0,
      changePercentage: {'btc': 2.5},
    ),
  );
}

@HiveType(typeId: 4)
@JsonSerializable(createToJson: false)
class CoinData {
  @HiveField(0)
  final double? price;

  @HiveField(1)
  @JsonKey(name: 'price_change_percentage_24h')
  final Map<String, double?>? changePercentage;

  const CoinData({
    this.price,
    this.changePercentage,
  });

  factory CoinData.fromJson(Map<String, dynamic> json) =>
      _$CoinDataFromJson(json);
}
