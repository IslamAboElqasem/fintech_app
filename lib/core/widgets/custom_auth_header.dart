import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class CustomAuthHeader extends StatelessWidget {
  const CustomAuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.topSpacing = 80,
    this.spacingBetween = 15,
  });

  final String title;
  final String subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final double topSpacing;
  final double spacingBetween;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        verticalSpace(topSpacing),
        Center(
          child: Text(
            textAlign: TextAlign.center,
            title,
            style:
                titleStyle ??
                (isDarkMode
                    ? TextStyles.font28SnowWhiteBold
                    : TextStyles.font28PrimaryBold),
          ),
        ),
        verticalSpace(spacingBetween),
        Center(
          child: Text(
            textAlign: TextAlign.center,
            subtitle,
            style:
                subtitleStyle ??
                (isDarkMode
                    ? TextStyles.font18SnowWhiteSemiBold
                    : TextStyles.font18OnboardingBlacktSemiBold),
          ),
        ),
      ],
    );
  }
}
