import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable(createToJson: false)
class ApiErrorModel {
  @JsonKey(name: 'error')
  final String? message;
  final int? statusCode;

  const ApiErrorModel({this.message, this.statusCode});
  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  // String getAllErrorsMessages() {
  //   return errors!.entries.map((entry) {
  //     final value = entry.value;
  //     return '${value.join(', ')}';
  //   }).join('\n');
  // }
}
