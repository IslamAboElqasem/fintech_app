// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_asset_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortfolioAssetModel _$PortfolioAssetModelFromJson(Map<String, dynamic> json) =>
    PortfolioAssetModel(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      amount: (json['amount'] as num).toDouble(),
      currentPriceUsd: (json['currentPriceUsd'] as num).toDouble(),
      totalValueUsd: (json['totalValueUsd'] as num).toDouble(),
      change24h: (json['change24h'] as num).toDouble(),
    );

Map<String, dynamic> _$PortfolioAssetModelToJson(
  PortfolioAssetModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'symbol': instance.symbol,
  'name': instance.name,
  'amount': instance.amount,
  'currentPriceUsd': instance.currentPriceUsd,
  'totalValueUsd': instance.totalValueUsd,
  'change24h': instance.change24h,
};
