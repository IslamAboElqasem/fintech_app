import 'package:fintech_app/core/networking/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_reuslt.freezed.dart';

@Freezed()
abstract class ApiReuslt<T> with _$ApiReuslt<T> {
  const factory ApiReuslt.success(T data) = Success<T>;
  const factory ApiReuslt.failure(ApiErrorModel apiErrorModel) = Failure<T>;
}
