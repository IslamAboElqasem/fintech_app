import 'package:fintech_app/core/theme/app_color.dart';
import 'package:fintech_app/features/onbaording/data/onboarding_data.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothPageCounterIndicator extends StatelessWidget {
  const SmoothPageCounterIndicator({
    super.key,
    required this.pageController,
    required this.isDarkMode,
  });

  final PageController pageController;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: onBoardingData.length,
      axisDirection: Axis.horizontal,
      effect: ExpandingDotsEffect(
        spacing: 6.0,
        radius: 24.0,
        dotWidth: 24.0,
        dotHeight: 8,
        paintStyle: PaintingStyle.fill,
        dotColor: AppColors.darkGray,
        activeDotColor: isDarkMode ? AppColors.snowWhite : AppColors.primary,
      ),
      onDotClicked: (index) {
        pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
    );
  }
}
