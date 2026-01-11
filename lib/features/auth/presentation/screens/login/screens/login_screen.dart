import 'package:fintech_app/core/helpers/extension.dart';
import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/core/routing/routes.dart';
import 'package:fintech_app/core/widgets/custom_auth_footer.dart';
import 'package:fintech_app/core/widgets/custom_auth_header.dart';
import 'package:fintech_app/core/widgets/custom_background_image.dart';
import 'package:fintech_app/core/widgets/custom_button.dart';
import 'package:fintech_app/core/widgets/custom_divider_with_text.dart';
import 'package:fintech_app/features/auth/logic/cubit/auth_cubit.dart';
import 'package:fintech_app/features/auth/presentation/screens/login/widgets/biometric_login_buttons.dart';
import 'package:fintech_app/features/auth/presentation/screens/login/widgets/build_login_bloc_listner.dart';
import 'package:fintech_app/features/auth/presentation/screens/login/widgets/login_form_feilds.dart';
import 'package:fintech_app/features/auth/presentation/screens/login/widgets/login_row_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildLoginBlocListner(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Stack(
            children: [
              const CustomBackgroundImage(),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 16.0.w,
                    horizontal: 20.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CustomAuthHeader(
                        title: 'Login To Your Account',
                        subtitle: 'Welcome back you\'ve been missed!',
                      ),
                      verticalSpace(100),
                      const LoginFormFeilds(),
                      LoginOptionsRow(
                        onRememberMeChanged: (value) {},
                        onForgotPasswordTap: () {},
                        isDarkMode: true,
                      ),
                      verticalSpace(30),
                      CustomButton(
                        text: 'Login',
                        onPressed: () => validateThenLogin(context),
                      ),
                      verticalSpace(36),
                      const CustomDividerWithText(text: 'Or login with'),
                      verticalSpace(30),
                      BiometricLoginButtons(
                        onFingerprintTap: () =>
                            context.pushNamed(Routes.fingerprintLoginScreen),
                        onFaceIdTap: () => context.pushNamed(
                          Routes.faceIdLoginScreen,
                        ),
                      ),
                      verticalSpace(22),
                      CustomAuthFooter(
                        prefixText: 'Don\'t have an account?',
                        actionText: 'Sign Up',
                        onActionTap: () =>
                            context.pushNamed(Routes.registerScreen),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void validateThenLogin(BuildContext context) {
    final formKey = context.read<AuthCubit>().loginFormKey;
    if (formKey.currentState?.validate() ?? false) {
      context.read<AuthCubit>().login();
    }
  }
}
