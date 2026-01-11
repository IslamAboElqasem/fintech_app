// ignore_for_file: unused_catch_clause

import 'package:dio/dio.dart';
import 'package:fintech_app/core/networking/api_error_handler.dart';
import 'package:fintech_app/core/networking/api_error_model.dart';
import 'package:fintech_app/core/networking/api_reuslt.dart';
import 'package:fintech_app/core/service/stripe_service.dart';
import 'package:fintech_app/features/payment/data/apis/coin_apis.dart';
import 'package:fintech_app/features/payment/data/models/coin_model/coin_model.dart';
import 'package:fintech_app/features/payment/data/models/coin_model/price_model.dart';

class PaymentRepo {
  final StripeService stripeService;
  final CoinService api;

  PaymentRepo({required this.stripeService, required this.api});

  Future<ApiReuslt<void>> makePayment({required intentRequestModel}) async {
    try {
      await stripeService.makePayment(intentRequestModel: intentRequestModel);
      return const ApiReuslt.success(null);
    } on PaymentCancelledException catch (e) {
      return const ApiReuslt.failure(
        ApiErrorModel(message: 'cancelled'),
      );
    } catch (e) {
      if (e is DioException) {
        final apiError = ApiErrorHandler.handle(e);
        return ApiReuslt.failure(apiError);
      } else {
        return ApiReuslt.failure(ApiErrorModel(message: e.toString()));
      }
    }
  }

  Future<ApiReuslt<void>> makePaymentWithCard({
    required intentRequestModel,
  }) async {
    try {
      await stripeService.makePaymentWithCard(
        intentRequestModel: intentRequestModel,
      );
      return const ApiReuslt.success(null);
    } on PaymentCancelledException catch (e) {
      return const ApiReuslt.failure(
        ApiErrorModel(message: 'cancelled'),
      );
    } catch (e) {
      if (e is DioException) {
        final apiError = ApiErrorHandler.handle(e);
        return ApiReuslt.failure(apiError);
      } else {
        return ApiReuslt.failure(ApiErrorModel(message: e.toString()));
      }
    }
  }

  Future<ApiReuslt<List<CoinModel>>> getCoins(String vsCurrency) async {
    try {
      final response = await api.getCoins(vsCurrency);

      //final coins = response.map((e) => CoinModel.fromJson(e));

      return ApiReuslt.success(response);
    } catch (e) {
      if (e is DioException) {
        final apiError = ApiErrorHandler.handle(e);
        return ApiReuslt.failure(apiError);
      } else {
        return ApiReuslt.failure(ApiErrorModel(message: e.toString()));
      }
    }
  }

  Future<ApiReuslt<SimplePriceModel>> getPrice({
    required String id,
    required String vs,
  }) async {
    try {
      final response = await api.getPrice(id, vs);

      //final price = SimplePriceModel.fromJson(response, id, vs);

      return ApiReuslt.success(response);
    } catch (e) {
      if (e is DioException) {
        final apiError = ApiErrorHandler.handle(e);
        return ApiReuslt.failure(apiError);
      } else {
        return ApiReuslt.failure(ApiErrorModel(message: e.toString()));
      }
    }
  }
}
