import 'package:fintech_app/core/helpers/flutter_toast.dart';
import 'package:fintech_app/core/routing/routes.dart';
import 'package:fintech_app/core/theme/app_color.dart';
import 'package:fintech_app/core/theme/text_styles.dart';
import 'package:fintech_app/features/payment/data/models/intent_request_model/request_model.dart';
import 'package:fintech_app/features/payment/presentation/cubit/payment_cubit.dart';
import 'package:fintech_app/features/payment/presentation/cubit/payment_states.dart';
import 'package:fintech_app/features/payment/presentation/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class CardPaymentScreen extends StatefulWidget {
  final String amount;
  final String crypto;
  final String cryptoAmount;
  final double exchangeFee;

  const CardPaymentScreen({
    super.key,
    required this.amount,
    required this.crypto,
    required this.cryptoAmount,
    required this.exchangeFee,
  });

  @override
  State<CardPaymentScreen> createState() => _CardPaymentScreenState();
}

class _CardPaymentScreenState extends State<CardPaymentScreen> {
  CardFieldInputDetails? _cardDetails;
  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: _handlePaymentStateChange,
      builder: (context, state) {
        final isLoading = state is PaymentLoading;
        return Scaffold(
          backgroundColor: AppColors.cloudWhite,
          appBar: AppBar(
            backgroundColor: AppColors.cloudWhite,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.primary),
              onPressed: isLoading
                  ? null
                  : () {
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    },
            ),
            title: Text('Card Payment', style: TextStyles.font24PrimaryBold),
            centerTitle: true,
          ),
          body: Stack(
            children: [
              _buildBody(context, isLoading),
              if (isLoading) _buildLoadingOverlay(),
            ],
          ),
        );
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

  Widget _buildBody(BuildContext context, bool isLoading) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                _buildAmountCard(),
                SizedBox(height: 30.h),
                Text(
                  'Card Details',
                  style: TextStyles.font18PrimaryBold,
                ),
                SizedBox(height: 16.h),
                _buildCardField(),
                SizedBox(height: 20.h),
                _buildSecurityNote(),
              ],
            ),
          ),
        ),
        _buildPayButton(context, isLoading),
      ],
    );
  }

  Widget _buildAmountCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Text(
            'You are paying',
            style: TextStyles.font14SmokeGrayRegular,
          ),
          SizedBox(height: 8.h),
          Text(
            '\$${widget.amount}',
            style: TextStyles.font24PrimaryBold.copyWith(
              fontSize: 32.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'For ${widget.cryptoAmount} ${widget.crypto}',
            style: TextStyles.font14SmokeGrayRegular,
          ),
        ],
      ),
    );
  }

  Widget _buildCardField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.stormGray.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.white,
      ),
      child: CardField(
        onCardChanged: (details) {
          setState(() {
            _cardDetails = details;
          });
        },
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        style: TextStyle(
          fontSize: 16.sp,
          color: AppColors.primary,
        ),
      ),
    );
  }

  Widget _buildSecurityNote() {
    return Row(
      children: [
        Icon(
          Icons.lock_outline,
          size: 16.sp,
          color: AppColors.stormGray,
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            'Your payment information is secure and encrypted',
            style: TextStyles.font12StormGrayRegular,
          ),
        ),
      ],
    );
  }

  Widget _buildPayButton(BuildContext context, bool isLoading) {
    final isCardComplete = _cardDetails?.complete ?? false;
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: PrimaryButton(
        text: 'Pay \$${widget.amount}',
        isLoading: isLoading,
        isEnabled: !isLoading && !_isProcessing && isCardComplete,
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
    if (_isProcessing || !(_cardDetails?.complete ?? false)) return;

    setState(() => _isProcessing = true);

    final intentRequest = IntentRequestModel(
      amount: widget.amount,
      currency: 'USD',
    );

    context.read<PaymentCubit>().makePaymentWithCard(
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
              // Go back to the buy crypto screen
              Navigator.of(context).popUntil(
                (route) =>
                    route.settings.name == Routes.buyCoins || route.isFirst,
              );
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
