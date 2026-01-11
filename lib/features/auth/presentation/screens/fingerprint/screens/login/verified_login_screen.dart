import 'package:fintech_app/core/helpers/extension.dart';
import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/core/routing/routes.dart';
import 'package:fintech_app/core/theme/app_images.dart';
import 'package:fintech_app/core/theme/text_styles.dart';
import 'package:fintech_app/core/widgets/custom_background_image.dart';
import 'package:fintech_app/core/widgets/custom_button.dart';
import 'package:fintech_app/features/auth/presentation/screens/fingerprint/widgets/custom_title_subtitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifiedLoginScreen extends StatelessWidget {
  const VerifiedLoginScreen({super.key});

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
                  Expanded(
                    child: Column(
                      children: [
                        verticalSpace(250),
                        Center(
                          child: Image.asset(
                            isDarkMode
                                ? AppImages.verifiedDarkImage
                                : AppImages.verifiedImage,
                            width: 150.w,
                            height: 150.h,
                          ),
                        ),
                        CustomTitleSubtitle(
                          topSpacing: 80,
                          title: ' You’re verified',
                          titleStyle: isDarkMode
                              ? TextStyles.font26SnowWhiteBold
                              : TextStyles.font26PrimaryBold,
                          subtitle:
                              'You have been verified your\ninformation completely. Let’s make transactions!',
                          subtitleStyle: isDarkMode
                              ? TextStyles.font18SnowWhiteRegular
                              : TextStyles.font18OnboardingBlackRegular,
                        ),
                      ],
                    ),
                  ),

                  CustomButton(
                    text: 'Continue To Home',
                    onPressed: () {
                      context.pushNamed(
                        Routes.homeScreen,
                      );
                    },
                  ),
                  verticalSpace(30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
