// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_data_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GlobalDataResponseAdapter extends TypeAdapter<GlobalDataResponse> {
  @override
  final typeId = 5;

  @override
  GlobalDataResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GlobalDataResponse(data: fields[0] as GlobalMarketData?);
  }

  @override
  void write(BinaryWriter writer, GlobalDataResponse obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GlobalDataResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GlobalMarketDataAdapter extends TypeAdapter<GlobalMarketData> {
  @override
  final typeId = 6;

  @override
  GlobalMarketData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GlobalMarketData(
      activeCryptocurrencies: (fields[0] as num?)?.toInt(),
      upcomingIcos: (fields[1] as num?)?.toInt(),
      ongoingIcos: (fields[2] as num?)?.toInt(),
      endedIcos: (fields[3] as num?)?.toInt(),
      markets: (fields[4] as num?)?.toInt(),
      totalMarketCap: (fields[5] as Map?)?.cast<String, double?>(),
      totalVolume: (fields[6] as Map?)?.cast<String, double?>(),
      marketCapPercentage: (fields[7] as Map?)?.cast<String, double?>(),
      marketCapChangePercentage24hUsd: (fields[8] as num?)?.toDouble(),
      updatedAt: (fields[9] as num?)?.toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, GlobalMarketData obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.activeCryptocurrencies)
      ..writeByte(1)
      ..write(obj.upcomingIcos)
      ..writeByte(2)
      ..write(obj.ongoingIcos)
      ..writeByte(3)
      ..write(obj.endedIcos)
      ..writeByte(4)
      ..write(obj.markets)
      ..writeByte(5)
      ..write(obj.totalMarketCap)
      ..writeByte(6)
      ..write(obj.totalVolume)
      ..writeByte(7)
      ..write(obj.marketCapPercentage)
      ..writeByte(8)
      ..write(obj.marketCapChangePercentage24hUsd)
      ..writeByte(9)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GlobalMarketDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GlobalDataResponse _$GlobalDataResponseFromJson(Map<String, dynamic> json) =>
    GlobalDataResponse(
      data: json['data'] == null
          ? null
          : GlobalMarketData.fromJson(json['data'] as Map<String, dynamic>),
    );

GlobalMarketData _$GlobalMarketDataFromJson(
  Map<String, dynamic> json,
) => GlobalMarketData(
  activeCryptocurrencies: (json['active_cryptocurrencies'] as num?)?.toInt(),
  upcomingIcos: (json['upcoming_icos'] as num?)?.toInt(),
  ongoingIcos: (json['ongoing_icos'] as num?)?.toInt(),
  endedIcos: (json['ended_icos'] as num?)?.toInt(),
  markets: (json['markets'] as num?)?.toInt(),
  totalMarketCap: (json['total_market_cap'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, (e as num?)?.toDouble()),
  ),
  totalVolume: (json['total_volume'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, (e as num?)?.toDouble()),
  ),
  marketCapPercentage: (json['market_cap_percentage'] as Map<String, dynamic>?)
      ?.map((k, e) => MapEntry(k, (e as num?)?.toDouble())),
  marketCapChangePercentage24hUsd:
      (json['market_cap_change_percentage_24h_usd'] as num?)?.toDouble(),
  updatedAt: (json['updated_at'] as num?)?.toInt(),
);
