import 'package:json_annotation/json_annotation.dart';

part 'coin_details_model.g.dart';

@JsonSerializable(createToJson: false)
class CoinDetailsModel {
  CoinDetailsModel({
    required this.id,
    required this.symbol,
    required this.name,
    required this.description,
    required this.image,
    required this.marketData,
  });

  final String? id;
  final String? symbol;
  final String? name;

  // Description is a map with language codes as keys
  final Map<String, dynamic> description;

  final Image? image;

  @JsonKey(name: 'market_data')
  final MarketData? marketData;

  factory CoinDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$CoinDetailsModelFromJson(json);

  // Helper to get English description
  String get descriptionText => description['en'] ?? '';
}

@JsonSerializable(createToJson: false)
class Image {
  Image({
    required this.thumb,
    required this.small,
    required this.large,
  });

  final String? thumb;
  final String? small;
  final String? large;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}

@JsonSerializable(createToJson: false)
class MarketData {
  MarketData({
    required this.currentPrice,
    required this.priceChangePercentage24h,
    required this.marketCap,
    required this.totalVolume,
    required this.totalSupply,
    required this.maxSupply,
    required this.circulatingSupply,
    required this.priceChange24h,
  });

  @JsonKey(name: 'current_price')
  final Map<String, double>? currentPrice;

  // ADDED: For the percentage badge (13.3%)
  @JsonKey(name: 'price_change_percentage_24h')
  final double? priceChangePercentage24h;

  @JsonKey(name: 'market_cap')
  final Map<String, double>? marketCap;

  @JsonKey(name: 'total_volume')
  final Map<String, double>? totalVolume;

  // Changed to double for precision
  @JsonKey(name: 'price_change_24h')
  final double? priceChange24h;

  // Changed to double to handle decimal values
  @JsonKey(name: 'total_supply')
  final double? totalSupply;

  @JsonKey(name: 'max_supply')
  final double? maxSupply;

  // ADDED: For "Available Supply" in statistics
  @JsonKey(name: 'circulating_supply')
  final double? circulatingSupply;

  factory MarketData.fromJson(Map<String, dynamic> json) =>
      _$MarketDataFromJson(json);
}
