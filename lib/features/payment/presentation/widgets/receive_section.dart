import 'package:fintech_app/core/theme/text_styles.dart';
import 'package:fintech_app/features/payment/presentation/widgets/currency_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReceiveSection extends StatelessWidget {
  final String label;
  final String amount;
  final String currency;
  final List<dynamic> currencies;
  final Function(String) onCurrencySelected;
  final bool isLoading;

  const ReceiveSection({
    super.key,
    required this.label,
    required this.amount,
    required this.currency,
    required this.currencies,
    required this.onCurrencySelected,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.font12StoneGrayMeduim,
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            Expanded(
              child: Text(amount, style: TextStyles.font20PrimaryBold),
            ),
            SizedBox(width: 8.w),
            CustomCurrencyDropdown(
              selectedCurrency: currency,
              currencies: currencies,
              onSelected: onCurrencySelected,
              icon: Icons.currency_bitcoin,
              isCrypto: true,
            ),
          ],
        ),
      ],
    );
  }
}
