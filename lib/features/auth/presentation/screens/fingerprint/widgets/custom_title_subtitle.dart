import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class CustomTitleSubtitle extends StatelessWidget {
  const CustomTitleSubtitle({
    super.key,
    required this.title,
    required this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.topSpacing = 0,
    this.spacingBetween = 22,
    this.textAlign = TextAlign.center,
  });

  final String title;
  final String subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final double topSpacing;
  final double spacingBetween;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(topSpacing),
        Text(
          title,
          textAlign: textAlign,
          style: titleStyle ?? TextStyles.font26PrimaryBold,
        ),
        verticalSpace(spacingBetween),
        Text(
          subtitle,
          textAlign: textAlign,
          style: subtitleStyle ?? TextStyles.font18OnboardingBlackRegular,
        ),
      ],
    );
  }
}
