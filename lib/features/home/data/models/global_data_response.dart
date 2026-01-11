import 'package:hive_ce/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'global_data_response.g.dart';

@HiveType(typeId: 5)
@JsonSerializable(createToJson: false)
class GlobalDataResponse {
  @HiveField(0)
  final GlobalMarketData? data;

  GlobalDataResponse({this.data});

  factory GlobalDataResponse.fromJson(Map<String, dynamic> json) =>
      _$GlobalDataResponseFromJson(json);
}

@HiveType(typeId: 6)
@JsonSerializable(createToJson: false)
class GlobalMarketData {
  @HiveField(0)
  @JsonKey(name: 'active_cryptocurrencies')
  final int? activeCryptocurrencies;

  @HiveField(1)
  @JsonKey(name: 'upcoming_icos')
  final int? upcomingIcos;

  @HiveField(2)
  @JsonKey(name: 'ongoing_icos')
  final int? ongoingIcos;

  @HiveField(3)
  @JsonKey(name: 'ended_icos')
  final int? endedIcos;

  @HiveField(4)
  final int? markets;

  @HiveField(5)
  @JsonKey(name: 'total_market_cap')
  final Map<String, double?>? totalMarketCap;

  @HiveField(6)
  @JsonKey(name: 'total_volume')
  final Map<String, double?>? totalVolume;

  @HiveField(7)
  @JsonKey(name: 'market_cap_percentage')
  final Map<String, double?>? marketCapPercentage;

  @HiveField(8)
  @JsonKey(name: 'market_cap_change_percentage_24h_usd')
  final double? marketCapChangePercentage24hUsd;

  @HiveField(9)
  @JsonKey(name: 'updated_at')
  final int? updatedAt;

  GlobalMarketData({
    this.activeCryptocurrencies,
    this.upcomingIcos,
    this.ongoingIcos,
    this.endedIcos,
    this.markets,
    this.totalMarketCap,
    this.totalVolume,
    this.marketCapPercentage,
    this.marketCapChangePercentage24hUsd,
    this.updatedAt,
  });

  factory GlobalMarketData.fromJson(Map<String, dynamic> json) =>
      _$GlobalMarketDataFromJson(json);

  factory GlobalMarketData.mock() {
    return GlobalMarketData(
      activeCryptocurrencies: 12345,
      upcomingIcos: 0,
      ongoingIcos: 0,
      endedIcos: 0,
      markets: 0,
      totalMarketCap: {'usd': 1234567890000.0},
      totalVolume: {'usd': 98765432100.0},
      marketCapChangePercentage24hUsd: 2.5,
      updatedAt: 0,
    );
  }
}
