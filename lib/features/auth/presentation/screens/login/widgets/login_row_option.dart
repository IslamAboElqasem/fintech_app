import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/core/theme/text_styles.dart';
import 'package:fintech_app/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginOptionsRow extends StatelessWidget {
  const LoginOptionsRow({
    super.key,
    required this.onForgotPasswordTap,
    required this.isDarkMode,
    this.isRememberMeChecked,
    this.onRememberMeChanged,
  });

  final bool? isRememberMeChecked;
  final void Function(bool?)? onRememberMeChanged;
  final void Function()? onForgotPasswordTap;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width: 24.w,
              height: 24.h,
              child: Checkbox(
                value: isRememberMeChecked ?? false,
                onChanged: onRememberMeChanged,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            ),
            horizontalSpace(8),
            Text(
              'Remember me',
              style: isDarkMode
                  ? TextStyles.font14PrimarySemiBold
                  : TextStyles.font14PrimarySemiBold,
            ),
          ],
        ),
        CustomTextButton(
          onTap: onForgotPasswordTap,
          isDarkMode: isDarkMode,
          text: 'Forget Password?',
          style: isDarkMode
              ? TextStyles.font14SnowWhiteSemiBold
              : TextStyles.font14PrimarySemiBold,
        ),
      ],
    );
  }
}
