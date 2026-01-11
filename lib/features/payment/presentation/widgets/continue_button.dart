import 'package:fintech_app/core/theme/app_color.dart';
import 'package:fintech_app/core/theme/text_styles.dart';
import 'package:fintech_app/features/payment/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContinueButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isEnabled;
  final String? text;
  final double? width;
  final double? height;

  const ContinueButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.text,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: text ?? 'Continue',
      onPressed: onPressed,
      isLoading: isLoading,
      isEnabled: isEnabled,
      backgroundColor: AppColors.primary,
      textColor: AppColors.snowWhite,
      loadingIndicatorColor: AppColors.alertOrange,
      borderRadius: 16.r,
      width: width,
      height: height ?? 56.h,
      textStyle: TextStyles.font18SnowWhiteBold,
      loadingSize: 20.r,
    );
  }
}

class ErrorMessage extends StatelessWidget {
  final String message;

  const ErrorMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.red[50],
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: AppColors.errorRed, size: 20.sp),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              message,
              style: TextStyle(color: AppColors.errorRed, fontSize: 14.sp),
            ),
          ),
        ],
      ),
    );
  }
}

class ConfirmationDialog extends StatelessWidget {
  final double convertedAmount;
  final String toCurrency;
  final String fromCurrency;
  final String payAmount;
  final double fee;
  final VoidCallback? onConfirm;

  const ConfirmationDialog({
    super.key,
    required this.convertedAmount,
    required this.toCurrency,
    required this.fromCurrency,
    required this.payAmount,
    required this.fee,
    this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      title: Text(
        'Confirm Purchase',
        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('You are about to buy:', style: TextStyle(fontSize: 14.sp)),
          SizedBox(height: 8.h),
          Text(
            '${convertedAmount.toStringAsFixed(4)} $toCurrency',
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.h),
          Text(
            'For: $fromCurrency $payAmount',
            style: TextStyle(fontSize: 14.sp),
          ),
          Text(
            'Fee: \$${fee.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 14.sp),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel', style: TextStyle(fontSize: 14.sp)),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            if (onConfirm != null) {
              onConfirm!();
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1E3A5F),
          ),
          child: Text('Confirm', style: TextStyle(fontSize: 14.sp)),
        ),
      ],
    );
  }
}
