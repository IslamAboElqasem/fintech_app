import 'package:json_annotation/json_annotation.dart';

part 'portfolio_asset_model.g.dart';

@JsonSerializable()
class PortfolioAssetModel {
  final String id;
  final String symbol;
  final String name;
  final double amount;
  final double currentPriceUsd;
  final double totalValueUsd;
  final double change24h;

  const PortfolioAssetModel({
    required this.id,
    required this.symbol,
    required this.name,
    required this.amount,
    required this.currentPriceUsd,
    required this.totalValueUsd,
    required this.change24h,
  });

  factory PortfolioAssetModel.fromJson(Map<String, dynamic> json) =>
      _$PortfolioAssetModelFromJson(json);

  Map<String, dynamic> toJson() => _$PortfolioAssetModelToJson(this);
}
