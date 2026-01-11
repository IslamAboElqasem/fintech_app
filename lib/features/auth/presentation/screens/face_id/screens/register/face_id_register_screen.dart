import 'package:fintech_app/core/helpers/extension.dart';
import 'package:fintech_app/core/helpers/shared_pref.dart';
import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/core/routing/routes.dart';
import 'package:fintech_app/core/theme/app_images.dart';
import 'package:fintech_app/core/widgets/custom_auth_header.dart';
import 'package:fintech_app/core/widgets/custom_background_image.dart';
import 'package:fintech_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FaceIdRegisterScreen extends StatelessWidget {
  const FaceIdRegisterScreen({super.key});

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
                        verticalSpace(50),
                        const CustomAuthHeader(
                          title: 'Set Your Face ID',
                          subtitle:
                              'Add your face ID to make your accountmore secure.',
                        ),
                        verticalSpace(100),
                        Center(
                          child: Image.asset(
                            isDarkMode
                                ? AppImages.faceIdVerifiedDarkImage
                                : AppImages.faceIdVerifiedImage,
                            width: 150.w,
                            height: 150.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          type: ButtonType.outlined,
                          text: 'Skip',
                          onPressed: () async {
                            final sharedPref = await SharedPref.getInstance();
                            final firstName =
                                sharedPref.getUserName() ?? 'User';
                            if (!context.mounted) return;
                            context.pushNamed(
                              Routes.homeScreen,
                              argument: firstName,
                            );
                          },
                        ),
                      ),
                      horizontalSpace(18),
                      Expanded(
                        child: CustomButton(
                          text: 'Continue',
                          onPressed: () async {
                            final sharedPref = await SharedPref.getInstance();
                            final firstName =
                                sharedPref.getUserName() ?? 'User';
                            if (!context.mounted) return;
                            context.pushNamed(
                              Routes.homeScreen,
                              argument: firstName,
                            );
                          },
                        ),
                      ),
                    ],
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
