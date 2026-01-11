import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/core/theme/app_color.dart';
import 'package:fintech_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasNumber;
  final bool hasSpecialCharacter;
  final bool hasMinLength;

  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasNumber,
    required this.hasSpecialCharacter,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          buildValidationItem(
            'At least 1 lowercase letter',
            hasLowerCase,
            context,
          ),
          verticalSpace(6),
          buildValidationItem(
            'At least 1 uppercase letter',
            hasUpperCase,
            context,
          ),
          verticalSpace(6),
          buildValidationItem('At least 1 number', hasNumber, context),
          verticalSpace(6),
          buildValidationItem(
            'At least 1 special character',
            hasSpecialCharacter,
            context,
          ),
          verticalSpace(6),
          buildValidationItem('At least 8 characters', hasMinLength, context),
        ],
      ),
    );
  }

  Widget buildValidationItem(
    String text,
    bool hasValidated,
    BuildContext context,
  ) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Row(
      children: [
        CircleAvatar(
          radius: 3.5,
          backgroundColor: isDarkMode
              ? AppColors.cloudWhite
              : AppColors.darkGray,
        ),
        horizontalSpace(6),
        Text(
          text,
          style: TextStyles.font12SmokeGrayRegular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: isDarkMode ? Colors.white : AppColors.primary,
            decorationThickness: 2.w,
            color: isDarkMode
                ? hasValidated
                      ? AppColors.mediumGray
                      : AppColors.cloudWhite
                : hasValidated
                ? AppColors.mediumGray
                : AppColors.primary,
          ),
        ),
      ],
    );
  }
}
