import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/features/onbaording/presentation/widgets/next_arrow_button.dart';
import 'package:fintech_app/features/onbaording/presentation/widgets/smooth_page_indicator.dart';
import 'package:flutter/material.dart';

class PageIndactorAndArrowButton extends StatelessWidget {
  const PageIndactorAndArrowButton({
    super.key,
    required this.pageController,
    required this.isDarkMode,
    this.onTap,
  });

  final PageController pageController;
  final bool isDarkMode;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SmoothPageCounterIndicator(
              pageController: pageController,
              isDarkMode: isDarkMode,
            ),
            GestureDetector(
              onTap: onTap,
              child: NextArrowButton(isDarkMode: isDarkMode),
            ),
          ],
        ),
        verticalSpace(20),
      ],
    );
  }
}
