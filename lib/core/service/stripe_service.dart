// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:fintech_app/core/networking/dio_factory.dart';
import 'package:fintech_app/features/payment/data/models/intent_request_model/request_model.dart';
import 'package:fintech_app/features/payment/data/models/intent_response_model/payment_intint_object/payment_intint_object.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  static final String _secretKey = dotenv.env['STRIPE_SECRET_KEY'] ?? '';
  Future<PaymentIntentObject> createPaymentIntent({
    required Map<String, dynamic> data,
  }) async {
    try {
      final dio = DioFactory.getDio(
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $_secretKey',
        },
      );
      Response response = await dio.post(
        'https://api.stripe.com/v1/payment_intents',
        data: data,
      );

      return PaymentIntentObject.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  static String calculateAmount(String amount) {
    final calculatedAmount = (double.parse(amount) * 100).toInt();
    return calculatedAmount.toString();
  }

  //init to payment sheet
  Future<void> initPaymentSheet({required clientSecret}) async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: 'Habiba Store',
          googlePay: const PaymentSheetGooglePay(
            merchantCountryCode: 'US',
            testEnv: true,
          ),
          customFlow: false,
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  //present payment sheet
  Future<void> presentPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
    } on StripeException catch (e) {
      // Handle different types of Stripe errors
      if (e.error.code == FailureCode.Canceled) {
        throw PaymentCancelledException('Payment was cancelled by user');
      } else if (e.error.code == FailureCode.Failed) {
        throw Exception(
          'Payment failed: ${e.error.message ?? "Unknown error"}',
        );
      } else {
        throw Exception('Stripe error: ${e.error.message ?? "Unknown error"}');
      }
    } catch (e) {
      rethrow;
    }
  }

  // Complete payment process with payment sheet (bottom sheet)
  Future<void> makePayment({
    required IntentRequestModel intentRequestModel,
  }) async {
    try {
      final data = {
        'amount': calculateAmount(intentRequestModel.amount),
        'currency': intentRequestModel.currency.toLowerCase(),
      };

      PaymentIntentObject paymentIntent = await createPaymentIntent(data: data);

      await initPaymentSheet(clientSecret: paymentIntent.clientSecret);
      await presentPaymentSheet();
    } on DioException catch (e) {
      if (e.response != null) {
        print('Dio data: ${e.response?.data}');
        throw Exception(
          'Network error: ${e.response?.statusMessage ?? "Unknown error"}',
        );
      } else {
        print('Error sending request: $e');
        throw Exception(
          'Connection error: Unable to connect to payment server',
        );
      }
    } catch (e) {
      print('General error: $e');
      rethrow;
    }
  }

  // Complete payment process with card (full screen - no payment sheet)
  Future<void> makePaymentWithCard({
    required IntentRequestModel intentRequestModel,
  }) async {
    try {
      final data = {
        'amount': calculateAmount(intentRequestModel.amount),
        'currency': intentRequestModel.currency.toLowerCase(),
      };

      PaymentIntentObject paymentIntent = await createPaymentIntent(data: data);

      // Confirm payment using card details collected by CardField
      await Stripe.instance.confirmPayment(
        paymentIntentClientSecret: paymentIntent.clientSecret!,
      );
    } on StripeException catch (e) {
      if (e.error.code == FailureCode.Canceled) {
        throw PaymentCancelledException('Payment was cancelled by user');
      } else if (e.error.code == FailureCode.Failed) {
        throw Exception(
          'Payment failed: ${e.error.message ?? "Unknown error"}',
        );
      } else {
        throw Exception('Stripe error: ${e.error.message ?? "Unknown error"}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(
          'Network error: ${e.response?.statusMessage ?? "Unknown error"}',
        );
      } else {
        throw Exception(
          'Connection error: Unable to connect to payment server',
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}

// Custom exception for payment cancellation
class PaymentCancelledException implements Exception {
  final String message;
  PaymentCancelledException(this.message);

  @override
  String toString() => message;
}
