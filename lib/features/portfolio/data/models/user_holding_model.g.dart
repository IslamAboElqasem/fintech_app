// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_holding_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserHoldingModelAdapter extends TypeAdapter<UserHoldingModel> {
  @override
  final typeId = 7;

  @override
  UserHoldingModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserHoldingModel(
      id: fields[0] as String,
      symbol: fields[1] as String,
      name: fields[2] as String,
      amount: (fields[3] as num).toDouble(),
    );
  }

  @override
  void write(BinaryWriter writer, UserHoldingModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.symbol)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserHoldingModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserHoldingModel _$UserHoldingModelFromJson(Map<String, dynamic> json) =>
    UserHoldingModel(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$UserHoldingModelToJson(UserHoldingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'amount': instance.amount,
    };
