import 'package:fintech_app/core/helpers/extension.dart';
import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/core/routing/routes.dart';
import 'package:fintech_app/core/theme/app_color.dart';
import 'package:fintech_app/core/theme/app_images.dart';
import 'package:fintech_app/core/theme/text_styles.dart';
import 'package:fintech_app/core/widgets/custom_auth_header.dart';
import 'package:fintech_app/core/widgets/custom_background_image.dart';
import 'package:fintech_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FingerprintRegisterScreen extends StatelessWidget {
  const FingerprintRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const CustomBackgroundImage(),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16.0.w,
                horizontal: 20.h,
              ),
              child: Column(
                children: [
                  const CustomAuthHeader(
                    title: 'Set Your Finger Print',
                    subtitle:
                        'Add a fingerprint to make your account more secure.',
                  ),
                  verticalSpace(100),
                  Image.asset(
                    color: isDarkMode
                        ? AppColors.snowWhite
                        : AppColors.lighterGray,
                    AppImages.fingerPrintImage,
                    width: 150.w,
                    height: 150.h,
                  ),
                  verticalSpace(100),
                  Text(
                    textAlign: TextAlign.center,
                    'Place your finger in fingerprint sensor until the icon completely',
                    style: isDarkMode
                        ? TextStyles.font16SnowWhiteRegular
                        : TextStyles.font16MediumGrayRegular,
                  ),
                  verticalSpace(60),
                  Align(
                    alignment: AlignmentGeometry.bottomRight,
                    child: CustomButton(
                      width: 162,
                      type: ButtonType.outlined,
                      text: 'Skip ',
                      onPressed: () => context.pushNamed(
                        Routes.verifiedRegisterScreen,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
