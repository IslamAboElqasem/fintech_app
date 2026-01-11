import 'package:fintech_app/core/helpers/extension.dart';
import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/core/routing/routes.dart';
import 'package:fintech_app/core/theme/app_color.dart';
import 'package:fintech_app/core/theme/app_images.dart';
import 'package:fintech_app/core/theme/text_styles.dart';
import 'package:fintech_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(120),
              Image.asset(
                AppImages.getStartedImage,
                width: 400,
                height: 350,
              ),
              verticalSpace(60),
              Text(
                'Get Started Now!',
                style: TextStyles.font36onboardingBlackBold.copyWith(
                  color: isDarkMode
                      ? AppColors.snowWhite
                      : AppColors.onboardingBlack,
                ),
              ),
              verticalSpace(60),
              CustomButton(
                text: 'Login',
                onPressed: () => context.pushNamed(Routes.loginScreen),
                type: ButtonType.filled,
              ),
              verticalSpace(18),
              CustomButton(
                text: 'Register',
                onPressed: () => context.pushNamed(Routes.registerScreen),
                type: ButtonType.outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
