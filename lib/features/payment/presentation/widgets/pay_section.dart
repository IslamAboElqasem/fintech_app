import 'package:fintech_app/core/theme/text_styles.dart';
import 'package:fintech_app/features/payment/presentation/widgets/currency_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaySection extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String currency;
  final List<dynamic> currencies;
  final VoidCallback onChanged;
  final Function(String) onCurrencySelected;
  final bool isEditable;

  const PaySection({
    super.key,
    required this.label,
    required this.controller,
    required this.currency,
    required this.currencies,
    required this.onChanged,
    required this.onCurrencySelected,
    this.isEditable = true,
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
              child: TextField(
                controller: controller,
                style: TextStyles.font20PrimaryBold,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '0.00',
                  prefix: Text('\$', style: TextStyles.font20PrimaryBold),
                  fillColor: Colors.transparent,
                ),
                onChanged: (_) => onChanged(),
              ),
            ),
            SizedBox(width: 8.w),
            CustomCurrencyDropdown(
              selectedCurrency: currency,
              currencies: currencies,
              onSelected: onCurrencySelected,
              icon: Icons.attach_money,
            ),
          ],
        ),
      ],
    );
  }
}
