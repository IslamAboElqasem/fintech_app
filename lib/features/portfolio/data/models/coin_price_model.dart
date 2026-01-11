import 'package:json_annotation/json_annotation.dart';

part 'coin_price_model.g.dart';

@JsonSerializable()
class CoinPriceModel {
  @JsonKey(name: 'usd')
  final double? price;

  @JsonKey(name: 'usd_24h_change')
  final double? change24h;

  const CoinPriceModel({
    this.price,
    this.change24h,
  });

  factory CoinPriceModel.fromJson(Map<String, dynamic> json) =>
      _$CoinPriceModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoinPriceModelToJson(this);
}
