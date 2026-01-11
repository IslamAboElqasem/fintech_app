import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/core/theme/app_images.dart';
import 'package:fintech_app/core/theme/text_styles.dart';
import 'package:fintech_app/core/widgets/custom_auth_header.dart';
import 'package:fintech_app/core/widgets/custom_background_image.dart';
import 'package:fintech_app/features/auth/logic/cubit/auth_cubit.dart';
import 'package:fintech_app/features/auth/presentation/screens/login/widgets/biometrics_bloc_listner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FaceIdLoginScreen extends StatefulWidget {
  const FaceIdLoginScreen({super.key});

  @override
  State<FaceIdLoginScreen> createState() => _FaceIdLoginScreenState();
}

class _FaceIdLoginScreenState extends State<FaceIdLoginScreen> {
  @override
  void initState() {
    super.initState();
    // Trigger biometric authentication when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthCubit>().authenticateWithBiometrics();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return BiomerticsBlocListner(
      child: Scaffold(
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
                      title: 'Face ID verification',
                      subtitle: '',
                    ),
                    verticalSpace(100),
                    Image.asset(
                      isDarkMode
                          ? AppImages.faceIdVerifiedDarkImage
                          : AppImages.faceIdVerifiedImage,
                      width: 150.w,
                      height: 150.h,
                    ),
                    verticalSpace(100),
                    Text(
                      textAlign: TextAlign.center,
                      'Please verify your identity using Face ID and it will proceed automatically.',
                      style: isDarkMode
                          ? TextStyles.font16SnowWhiteRegular
                          : TextStyles.font16MediumGrayRegular,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
