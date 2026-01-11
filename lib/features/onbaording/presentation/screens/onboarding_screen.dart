import 'package:fintech_app/core/helpers/extension.dart';
import 'package:fintech_app/core/routing/routes.dart';
import 'package:fintech_app/features/onbaording/data/onboarding_data.dart';
import 'package:fintech_app/features/onbaording/presentation/widgets/onboarding_item.dart';
import 'package:fintech_app/features/onbaording/presentation/widgets/page_indicator_and_arrow_button.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void _skipButton() {
    context.pushReplacementNamed(Routes.authFlow);
  }

  void _onNextPage() {
    if (pageController.hasClients) {
      final currentPage = pageController.page?.round() ?? 0;
      if (currentPage < onBoardingData.length - 1) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        _skipButton();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 18),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                scrollDirection: Axis.horizontal,
                itemCount: onBoardingData.length,
                itemBuilder: (context, index) {
                  return OnboardingItem(
                    onTap: _skipButton,
                    model: onBoardingData[index],
                  );
                },
              ),
            ),
            PageIndactorAndArrowButton(
              onTap: _onNextPage,
              pageController: pageController,
              isDarkMode: isDarkMode,
            ),
          ],
        ),
      ),
    );
  }
}
