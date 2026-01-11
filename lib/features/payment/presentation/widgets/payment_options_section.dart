import 'package:fintech_app/core/theme/app_color.dart';
import 'package:fintech_app/core/theme/app_images.dart';
import 'package:fintech_app/core/theme/text_styles.dart';
import 'package:fintech_app/features/payment/presentation/widgets/credit_card_widget.dart';
import 'package:fintech_app/features/payment/presentation/widgets/payment_method_chips.dart';
import 'package:fintech_app/features/payment/presentation/widgets/payment_option_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentOptionsSection extends StatelessWidget {
  final VoidCallback onPaymentMethodTap;

  const PaymentOptionsSection({
    super.key,
    required this.onPaymentMethodTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: AppColors.snowWhite,
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Credit Card',
                      style: TextStyles.font16PrimaryBold,
                    ),
                    const Spacer(),
                    const Image(
                      image: AssetImage(AppImages.arrowDownImage),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                const PaymentMethodChips(),
                SizedBox(height: 24.h),
                const CreditCardWidget(
                  cardNumber: '8699  9257  0928  3456',
                  expiryDate: '09/24',
                  cardHolder: 'Arafat Alam',
                  cardType: 'VISA',
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 17.h),
        PaymentOptionTile(
          title: 'Google Pay',
          onTap: onPaymentMethodTap,
        ),
        SizedBox(height: 12.h),
        PaymentOptionTile(
          title: 'Mobile Banking',
          onTap: onPaymentMethodTap,
        ),
      ],
    );
  }
}
