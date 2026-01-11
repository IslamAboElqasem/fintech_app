import 'dart:developer';
import 'package:fintech_app/core/networking/api_reuslt.dart';
import 'package:fintech_app/features/payment/data/models/intent_request_model/request_model.dart';
import 'package:fintech_app/features/payment/data/repos/payment_repo.dart';
import 'package:fintech_app/features/payment/presentation/cubit/payment_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final PaymentRepo paymentRepo;

  PaymentCubit({required this.paymentRepo}) : super(PaymentInitial());

  Future<void> makePayment({
    required IntentRequestModel intentRequestModel,
  }) async {
    emit(PaymentLoading());
    try {
      final ApiReuslt<void> result = await paymentRepo.makePayment(
        intentRequestModel: intentRequestModel,
      );

      result.when(
        success: (_) => emit(PaymentSuccess()),
        failure: (error) {
          if (error.message == 'cancelled') {
            emit(PaymentCancelled());
          } else {
            emit(PaymentFailure(message: error.message ?? 'Payment failed'));
          }
        },
      );
    } catch (e) {
      emit(PaymentFailure(message: 'UnExpected Error ${e.toString()}'));
    }
  }

  void resetPayment() {
    emit(PaymentInitial());
  }

  Future<void> makePaymentWithCard({
    required IntentRequestModel intentRequestModel,
  }) async {
    emit(PaymentLoading());
    try {
      final ApiReuslt<void> result = await paymentRepo.makePaymentWithCard(
        intentRequestModel: intentRequestModel,
      );

      result.when(
        success: (_) => emit(PaymentSuccess()),
        failure: (error) {
          if (error.message == 'cancelled') {
            emit(PaymentCancelled());
          } else {
            emit(PaymentFailure(message: error.message ?? 'Payment failed'));
          }
        },
      );
    } catch (e) {
      emit(PaymentFailure(message: 'UnExpected Error ${e.toString()}'));
    }
  }

  Future<void> fetchCoins() async {
    emit(CoinLoading());
    final result = await paymentRepo.getCoins("usd");

    result.when(
      success: (coins) {
        emit(CoinLoaded(coins));
      },
      failure: (error) {
        emit(CoinFailure(error.message!));
      },
    );
  }

  Future<void> fetchPrice({required String id, required String vs}) async {
    emit(CoinLoading());
    final result = await paymentRepo.getPrice(id: id, vs: vs);
    log(result.toString());
    result.when(
      success: (price) {
        log(price.toString());
        emit(CoinPriceLoaded(price));
      },
      failure: (error) {
        emit(CoinFailure(error.message!));
      },
    );
  }
}
