import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/core/theme/app_color.dart';
import 'package:fintech_app/core/theme/text_styles.dart';
import 'package:fintech_app/core/widgets/custom_text_button.dart';
import 'package:fintech_app/features/onbaording/model/onboarding_model.dart';
import 'package:flutter/material.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({
    super.key,
    required this.model,
    this.onTap,
  });
  final void Function()? onTap;
  final OnboardingModel model;
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: SafeArea(
            child: CustomTextButton(
              onTap: onTap,
              isDarkMode: isDarkMode,
              text: 'Skip ',
            ),
          ),
        ),
        verticalSpace(60),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(model.image),
              verticalSpace(80),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: model.title,
                      style: TextStyles.font36onboardingBlackBold.copyWith(
                        color: isDarkMode
                            ? AppColors.snowWhite
                            : AppColors.onboardingBlack,
                      ),
                    ),
                    if (model.richTitle != null)
                      TextSpan(
                        text: model.richTitle,
                        style: TextStyles.font36onboardingPrimary,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
