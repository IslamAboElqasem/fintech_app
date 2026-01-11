// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TrendingResponseAdapter extends TypeAdapter<TrendingResponse> {
  @override
  final typeId = 1;

  @override
  TrendingResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TrendingResponse(coins: (fields[0] as List?)?.cast<CoinWrapper>());
  }

  @override
  void write(BinaryWriter writer, TrendingResponse obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.coins);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrendingResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CoinWrapperAdapter extends TypeAdapter<CoinWrapper> {
  @override
  final typeId = 2;

  @override
  CoinWrapper read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CoinWrapper(item: fields[0] as CoinItem?);
  }

  @override
  void write(BinaryWriter writer, CoinWrapper obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.item);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoinWrapperAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CoinItemAdapter extends TypeAdapter<CoinItem> {
  @override
  final typeId = 3;

  @override
  CoinItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CoinItem(
      name: fields[0] as String?,
      symbol: fields[1] as String?,
      image: fields[2] as String?,
      data: fields[3] as CoinData?,
    );
  }

  @override
  void write(BinaryWriter writer, CoinItem obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.symbol)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoinItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CoinDataAdapter extends TypeAdapter<CoinData> {
  @override
  final typeId = 4;

  @override
  CoinData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CoinData(
      price: (fields[0] as num?)?.toDouble(),
      changePercentage: (fields[1] as Map?)?.cast<String, double?>(),
    );
  }

  @override
  void write(BinaryWriter writer, CoinData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.price)
      ..writeByte(1)
      ..write(obj.changePercentage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoinDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrendingResponse _$TrendingResponseFromJson(Map<String, dynamic> json) =>
    TrendingResponse(
      coins: (json['coins'] as List<dynamic>?)
          ?.map((e) => CoinWrapper.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

CoinWrapper _$CoinWrapperFromJson(Map<String, dynamic> json) => CoinWrapper(
  item: json['item'] == null
      ? null
      : CoinItem.fromJson(json['item'] as Map<String, dynamic>),
);

CoinItem _$CoinItemFromJson(Map<String, dynamic> json) => CoinItem(
  name: json['name'] as String?,
  symbol: json['symbol'] as String?,
  image: json['small'] as String?,
  data: json['data'] == null
      ? null
      : CoinData.fromJson(json['data'] as Map<String, dynamic>),
);

CoinData _$CoinDataFromJson(Map<String, dynamic> json) => CoinData(
  price: (json['price'] as num?)?.toDouble(),
  changePercentage:
      (json['price_change_percentage_24h'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num?)?.toDouble()),
      ),
);
