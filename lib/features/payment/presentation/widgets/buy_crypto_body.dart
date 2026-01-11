import 'package:fintech_app/core/routing/routes.dart';
import 'package:fintech_app/core/theme/app_color.dart';
import 'package:fintech_app/features/payment/presentation/cubit/payment_states.dart';
import 'package:fintech_app/features/payment/presentation/widgets/continue_button.dart';
import 'package:fintech_app/features/payment/presentation/widgets/exchange_rate_info.dart';
import 'package:fintech_app/features/payment/presentation/widgets/fee_card.dart';
import 'package:fintech_app/features/payment/presentation/widgets/pay_section.dart';
import 'package:fintech_app/features/payment/presentation/widgets/receive_section.dart';
import 'package:fintech_app/features/payment/presentation/widgets/swap_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// The body of the Buy Crypto screen.
class BuyCryptoBody extends StatelessWidget {
  final TextEditingController amountController;
  final String fromCurrency;
  final String toCurrency;
  final PaymentState state;
  final List<dynamic> allCurrencies; // List of all available currencies
  final double currentPrice;
  final bool isFiatToCrypto;
  final VoidCallback onSwap;
  final VoidCallback onAmountChanged; // Callback when the amount changes
  final Function(String, bool)
  onCurrencySelected; // Callback when a currency is selected

  const BuyCryptoBody({
    super.key,
    required this.amountController,
    required this.fromCurrency,
    required this.toCurrency,
    required this.state,
    required this.allCurrencies,
    required this.currentPrice,
    required this.isFiatToCrypto,
    required this.onSwap,
    required this.onAmountChanged,
    required this.onCurrencySelected,
  });

  double _getAmount() {
    return double.tryParse(amountController.text.replaceAll(',', '')) ?? 0;
  }

  double _getConvertedAmount() {
    if (currentPrice == 0.0) return 0.0;
    final amount = _getAmount();
    return isFiatToCrypto ? (amount / currentPrice) : (amount * currentPrice);
  }

  double _getExchangeRate() {
    if (currentPrice == 0.0) return 0.0;
    return isFiatToCrypto ? (1 / currentPrice) : currentPrice;
  }

  double _calculateFee() => _getAmount() * 0.0005;

  @override
  Widget build(BuildContext context) {
    final convertedAmount = _getConvertedAmount();
    final exchangeRate = _getExchangeRate();

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: AppColors.snowWhite,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(18.w),
                child: Column(
                  children: [
                    PaySection(
                      label: 'You Pay',
                      controller: amountController,
                      currency: fromCurrency,
                      currencies: allCurrencies,
                      onChanged: onAmountChanged,
                      onCurrencySelected: (c) => onCurrencySelected(c, true),
                      isEditable: true,
                    ),
                    SizedBox(height: 31.h),
                    SwapButton(onSwap: onSwap),
                    SizedBox(height: 31.h),
                    ReceiveSection(
                      label: 'You Receive',
                      amount: state is CoinLoading
                          ? 'Loading...'
                          : convertedAmount.toStringAsFixed(2),
                      currency: toCurrency,
                      currencies: allCurrencies,
                      onCurrencySelected: (c) => onCurrencySelected(c, false),
                      isLoading: state is CoinLoading,
                    ),
                    SizedBox(height: 46.h),
                    if (exchangeRate > 0)
                      ExchangeRateInfo(
                        fromCurrency: fromCurrency,
                        toCurrency: toCurrency,
                        rate: exchangeRate,
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 34.h),
            FeeCard(fee: _calculateFee()),
            SizedBox(height: 40.h),
            ContinueButton(
              isLoading: state is CoinLoading,
              onPressed: () =>
                  _showConfirmationDialog(context, convertedAmount),
            ),
            SizedBox(height: 16.h),
            if (state is CoinFailure)
              ErrorMessage(message: (state as CoinFailure).message),
          ],
        ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context, double convertedAmount) {
    final parentContext = context; // Save parent context for navigation

    showDialog(
      context: context,
      builder: (dialogContext) => ConfirmationDialog(
        convertedAmount: convertedAmount,
        toCurrency: toCurrency,
        fromCurrency: fromCurrency,
        payAmount: amountController.text,
        fee: _calculateFee(),
        onConfirm: () {
          Navigator.of(dialogContext).pop(); // Close dialog
          Navigator.pushNamed(
            parentContext, // Use parent context for navigation
            Routes.paymentDetails,
            arguments: {
              'amount': amountController.text,
              'crypto': toCurrency,
              'cryptoAmount': convertedAmount.toStringAsFixed(6),
              'exchangeFee': _calculateFee(),
            },
          );
        },
      ),
    );
  }
}
