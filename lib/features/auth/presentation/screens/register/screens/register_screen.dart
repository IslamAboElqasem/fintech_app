import 'package:fintech_app/core/helpers/extension.dart';
import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/core/routing/routes.dart';
import 'package:fintech_app/core/widgets/custom_auth_footer.dart';
import 'package:fintech_app/core/widgets/custom_auth_header.dart';
import 'package:fintech_app/core/widgets/custom_background_image.dart';
import 'package:fintech_app/core/widgets/custom_button.dart';
import 'package:fintech_app/features/auth/logic/cubit/auth_cubit.dart';
import 'package:fintech_app/features/auth/presentation/screens/register/widgets/build_register_bloc_listner.dart';
import 'package:fintech_app/features/auth/presentation/screens/register/widgets/register_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildRegisterBlocListner(
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
                        topSpacing: 50,
                        title: 'Create Your Account',
                        subtitle:
                            'Sign up to enjoy the best managing experience!',
                      ),
                      verticalSpace(45),
                      RegisterFormFields(
                        doneOnConfirmPasswordTovalidateThenLogin: () =>
                            validateThenRegister(context),
                      ),
                      CustomButton(
                        text: 'Register',
                        onPressed: () => validateThenRegister(context),
                      ),
                      verticalSpace(22),
                      CustomAuthFooter(
                        prefixText: 'Already have an account? ',
                        actionText: 'Login',
                        onActionTap: () => context.pushNamedAndRemoveUntil(
                          Routes.loginScreen,
                          (route) => false,
                        ),
                      ),
                      verticalSpace(18),
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

  void validateThenRegister(BuildContext context) {
    final formKey = context.read<AuthCubit>().registerFormKey;
    if (formKey.currentState?.validate() ?? false) {
      context.read<AuthCubit>().register();
    }
  }
}
