import 'package:hive_ce/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_holding_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 7)
class UserHoldingModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String symbol;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final double amount;

  const UserHoldingModel({
    required this.id,
    required this.symbol,
    required this.name,
    required this.amount,
  });

  factory UserHoldingModel.fromJson(Map<String, dynamic> json) =>
      _$UserHoldingModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserHoldingModelToJson(this);
}
