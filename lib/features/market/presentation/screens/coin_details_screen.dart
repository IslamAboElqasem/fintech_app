import 'package:fintech_app/core/routing/routes.dart';
import 'package:fintech_app/core/widgets/custom_button.dart';
import 'package:fintech_app/core/widgets/custom_loading_dialog.dart';
import 'package:fintech_app/features/coin_details/data/model/coin_details_model.dart'
    hide Image;
import 'package:fintech_app/features/coin_details/logic/cubit/coin_details_cubit.dart';
import 'package:fintech_app/features/coin_details/logic/cubit/coin_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/text_styles.dart';

class CoinDetailsScreen extends StatefulWidget {
  const CoinDetailsScreen({super.key});

  @override
  State<CoinDetailsScreen> createState() => _CoinDetailsScreenState();
}

class _CoinDetailsScreenState extends State<CoinDetailsScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch coin details when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final coinId = ModalRoute.of(context)?.settings.arguments as String?;
      if (coinId != null && coinId.isNotEmpty) {
        context.read<CoinDetailsCubit>().getCoinDetails(coinId);
      } else {
        // Show error and navigate back
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error: No coin ID provided')),
        );
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CoinDetailsCubit, CoinDetailsState>(
          builder: (context, state) {
            return state.when(
              loading: () => const Center(child: CustomLoadingDialog()),
              error: (error) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Error: $error',
                      style: TextStyles.font16MediumGrayRegular,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16.h),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Go Back'),
                    ),
                  ],
                ),
              ),
              success: (coinDetails) =>
                  _buildCoinDetailsContent(context, coinDetails),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCoinDetailsContent(
    BuildContext context,
    CoinDetailsModel coinDetails,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back_outlined, size: 24.sp),
                  padding: EdgeInsets.zero,
                ),
                Text("Coin Details", style: TextStyles.font24PrimaryBold),
                SizedBox(width: 48.w),
              ],
            ),
            SizedBox(height: 16.h),

            // Coin Header
            Row(
              children: [
                Container(
                  width: 52.sp,
                  height: 52.sp,
                  decoration: BoxDecoration(
                    color: AppColors.snowWhite,
                    borderRadius: BorderRadius.circular(40.sp),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(6.sp),
                    child: Image.network(
                      coinDetails.image?.thumb ?? "",
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.currency_bitcoin),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coinDetails.name ?? "Unknown",
                      style: TextStyles.font18DeepForestBold,
                    ),
                    Text(
                      (coinDetails.symbol ?? "").toUpperCase(),
                      style: TextStyles.font16MediumGrayRegular,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.h),

            // Current Price Display
            Container(
              padding: EdgeInsets.all(16.sp),
              decoration: BoxDecoration(
                color: AppColors.snowWhite,
                borderRadius: BorderRadius.circular(12.sp),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "\$${coinDetails.marketData?.currentPrice?['usd']?.toStringAsFixed(2) ?? '0.00'}",
                      style: TextStyles.font24PrimaryBold,
                    ),
                  ),
                  if (coinDetails.marketData?.priceChangePercentage24h != null)
                    Container(
                      width: 80.w,
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(8.sp),
                      ),

                      child: Text(
                        textAlign: TextAlign.center,
                        "${coinDetails.marketData!.priceChangePercentage24h! >= 0 ? '+ ' : ''}${coinDetails.marketData!.priceChangePercentage24h!.toStringAsFixed(2)}%",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color:
                              coinDetails
                                      .marketData!
                                      .priceChangePercentage24h! >=
                                  0
                              ? AppColors.snowWhite
                              : AppColors.snowWhite,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 20.h),

            // Statistics
            Text(
              "Statistics",
              style: TextStyles.font18OnboardingBlacktSemiBold,
            ),
            SizedBox(height: 12.h),
            _staticsRow(
              "Market Cap",
              "\$${_formatNumber(coinDetails.marketData?.marketCap?['usd'])}",
            ),
            _divider(),
            _staticsRow(
              "Volume 24h",
              "\$${_formatNumber(coinDetails.marketData?.totalVolume?['usd'])}",
            ),
            _divider(),
            _staticsRow(
              "Available Supply",
              _formatNumber(coinDetails.marketData?.circulatingSupply),
            ),
            _divider(),
            _staticsRow(
              "Max Supply",
              coinDetails.marketData?.maxSupply != null
                  ? _formatNumber(coinDetails.marketData!.maxSupply)
                  : "Unlimited",
            ),
            SizedBox(height: 22.h),

            // About Section
            Text(
              "About ${coinDetails.name ?? 'Coin'}",
              style: TextStyles.font18OnboardingBlacktSemiBold,
            ),
            SizedBox(height: 12.h),
            Text(
              coinDetails.descriptionText.isNotEmpty
                  ? _stripHtmlTags(coinDetails.descriptionText)
                  : "No description available",
              style: TextStyles.font16SmokeGrayRegular,
              maxLines: 18,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 25.h),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    borderColor: AppColors.errorRed.withAlpha(90),
                    text: 'Sell',
                    onPressed: () {},
                    backgroundColor: AppColors.errorRed.withAlpha(75),
                    textColor: AppColors.redColor,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: CustomButton(
                    text: 'Buy',
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.buyCoins);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 25.h),
          ],
        ),
      ),
    );
  }

  Widget _staticsRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyles.font14LatoMedium,
          ),
          Text(
            value,
            style: TextStyles.font14LatoMedium,
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Container(
      height: 1.h,
      color: AppColors.lightGray,
      width: double.infinity,
    );
  }

  String _formatNumber(double? number) {
    if (number == null) return "N/A";
    if (number >= 1000000000) {
      return "${(number / 1000000000).toStringAsFixed(2)}B";
    } else if (number >= 1000000) {
      return "${(number / 1000000).toStringAsFixed(2)}M";
    } else if (number >= 1000) {
      return "${(number / 1000).toStringAsFixed(2)}K";
    }
    return number.toStringAsFixed(2);
  }

  String _stripHtmlTags(String html) {
    return html
        .replaceAll(RegExp(r'<[^>]*>'), '')
        .replaceAll('&nbsp;', ' ')
        .trim();
  }
}
