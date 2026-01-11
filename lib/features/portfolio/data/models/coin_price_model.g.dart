// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_price_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinPriceModel _$CoinPriceModelFromJson(Map<String, dynamic> json) =>
    CoinPriceModel(
      price: (json['usd'] as num?)?.toDouble(),
      change24h: (json['usd_24h_change'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CoinPriceModelToJson(CoinPriceModel instance) =>
    <String, dynamic>{
      'usd': instance.price,
      'usd_24h_change': instance.change24h,
    };
