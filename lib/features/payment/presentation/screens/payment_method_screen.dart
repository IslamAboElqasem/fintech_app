import 'package:fintech_app/core/helpers/flutter_toast.dart';
import 'package:fintech_app/core/routing/routes.dart';
import 'package:fintech_app/core/theme/app_color.dart';
import 'package:fintech_app/core/theme/text_styles.dart';
import 'package:fintech_app/features/payment/data/models/intent_request_model/request_model.dart';
import 'package:fintech_app/features/payment/presentation/cubit/payment_cubit.dart';
import 'package:fintech_app/features/payment/presentation/cubit/payment_states.dart';
import 'package:fintech_app/features/payment/presentation/widgets/payment_options_section.dart';
import 'package:fintech_app/features/payment/presentation/widgets/primary_button.dart';
import 'package:fintech_app/features/payment/presentation/widgets/receipt_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodScreen extends StatefulWidget {
  final String amount;
  final String crypto;
  final String cryptoAmount;
  final double exchangeFee;

  const PaymentMethodScreen({
    super.key,
    required this.amount,
    required this.crypto,
    required this.cryptoAmount,
    required this.exchangeFee,
  });

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  bool _sendReceipt = false;
  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: _handlePaymentStateChange,
      builder: (context, state) {
        final isLoading = state is PaymentLoading;
        return _buildScaffold(context, isLoading);
      },
    );
  }

  void _handlePaymentStateChange(BuildContext context, PaymentState state) {
    if (state is PaymentSuccess) {
      _isProcessing = false;
      _showSuccessDialog();
    } else if (state is PaymentFailure) {
      _isProcessing = false;
      FlutterToast.showFlutterToast(
        message: state.message,
        state: ToastStates.error,
        context: context,
      );
    }
  }

  Widget _buildScaffold(BuildContext context, bool isLoading) {
    return Scaffold(
      backgroundColor: AppColors.cloudWhite,
      appBar: AppBar(
        backgroundColor: AppColors.cloudWhite,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: isLoading
              ? null
              : () => Navigator.pushReplacementNamed(context, Routes.buyCoins),
        ),
        title: Text('Payment method', style: TextStyles.font24PrimaryBold),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          _buildBody(context, isLoading),
          if (isLoading) _buildLoadingOverlay(),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context, bool isLoading) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.h),
                PaymentOptionsSection(
                  onPaymentMethodTap: () => _processPayment(context),
                ),
                SizedBox(height: 24.h),
                ReceiptSwitch(
                  value: _sendReceipt,
                  onChanged: (value) => setState(() => _sendReceipt = value),
                ),
              ],
            ),
          ),
        ),
        _buildBottomButton(context, isLoading),
      ],
    );
  }

  Widget _buildBottomButton(BuildContext context, bool isLoading) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: PrimaryButton(
        text: 'Buy',
        isLoading: isLoading,
        isEnabled: !isLoading && !_isProcessing,
        onPressed: () => _processPayment(context),
      ),
    );
  }

  Widget _buildLoadingOverlay() {
    return Container(
      color: Colors.black26,
      child: const Center(child: CircularProgressIndicator()),
    );
  }

  void _processPayment(BuildContext context) {
    if (_isProcessing) return;

    setState(() => _isProcessing = true);

    final intentRequest = IntentRequestModel(
      amount: widget.amount,
      currency: 'USD',
    );

    context.read<PaymentCubit>().makePayment(
      intentRequestModel: intentRequest,
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 28.sp),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                'Payment Successful',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        content: Text(
          'Your payment of \$${widget.amount} has been processed successfully!\n\n'
          'You will receive ${widget.cryptoAmount} ${widget.crypto}',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              context.read<PaymentCubit>().resetPayment();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  // void _showErrorSnackBar(String message) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(message),
  //       backgroundColor: Colors.red,
  //     ),
  //   );
  // }
}
