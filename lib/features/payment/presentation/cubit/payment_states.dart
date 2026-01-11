import 'package:fintech_app/features/payment/data/models/coin_model/coin_model.dart';
import 'package:fintech_app/features/payment/data/models/coin_model/price_model.dart';

abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

class PaymentLoading extends PaymentState {}

class PaymentFailure extends PaymentState {
  final String message;
  PaymentFailure({required this.message});
}

class PaymentSuccess extends PaymentState {
  final String? transactionId;

  PaymentSuccess({this.transactionId});
}

class PaymentCancelled extends PaymentState {}

class CoinLoading extends PaymentState {}

class CoinLoaded extends PaymentState {
  final List<CoinModel> coins;
  CoinLoaded(this.coins);
}

class CoinPriceLoaded extends PaymentState {
  final SimplePriceModel price;
  CoinPriceLoaded(this.price);
}

class CoinFailure extends PaymentState {
  final String message;
  CoinFailure(this.message);
}
