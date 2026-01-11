// ignore_for_file: avoid_print, unused_local_variable

import 'package:dart_either/dart_either.dart';
import 'package:dio/dio.dart';
import 'package:fintech_app/core/networking/api_constant.dart';
import 'package:fintech_app/core/networking/api_error_handler.dart';
import 'package:fintech_app/core/networking/api_error_model.dart';
import 'package:fintech_app/core/networking/dio_factory.dart';

class DioRepository {
  DioRepository() {
    configureDio();
  }
  static Dio dio = DioFactory.getDio();
  static void configureDio() {
    // Set default configs
    dio.options.baseUrl = ApiConstant.baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(seconds: 3);
  }

  static Future<Either<ApiErrorModel, dynamic>> getRequest(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    Either<ApiErrorModel, dynamic> result;
    configureDio();
    try {
      Response response = await dio.get(
        endpoint,
        queryParameters: queryParameters,
      );
      print(response.data);
      return result = Right(response.data);
    } catch (e) {
      print("Dio GET Request Error: $e");
      return result = Left(ApiErrorHandler.handle(e));
    }
  }
}
