import 'package:fintech_app/core/helpers/app_regex.dart';
import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/core/icons/my_flutter_app_icons.dart';
import 'package:fintech_app/core/widgets/custom_text_form_field.dart';
import 'package:fintech_app/features/auth/logic/cubit/auth_cubit.dart';
import 'package:fintech_app/features/auth/presentation/screens/register/widgets/password_validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterFormFields extends StatefulWidget {
  const RegisterFormFields({
    super.key,
    required this.doneOnConfirmPasswordTovalidateThenLogin,
  });

  final void Function() doneOnConfirmPasswordTovalidateThenLogin;

  @override
  State<RegisterFormFields> createState() => _RegisterFormFieldsState();
}

class _RegisterFormFieldsState extends State<RegisterFormFields> {
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasNumber = false;
  bool hasSpecialCharacter = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<AuthCubit>().registerPasswordController;
    _formKey = GlobalKey<FormState>();
    context.read<AuthCubit>().registerFormKey = _formKey;
    setupPasswordControllerListner();
  }

  void setupPasswordControllerListner() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasSpecialCharacter = AppRegex.hasSpecialCharacter(
          passwordController.text,
        );
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: context.read<AuthCubit>().registerFirstNameController,
            hintText: 'First Name',
            onTap: () {},
            prefixIcon: const Icon(MyFlutterApp.profileicon),
            validator: (String value) {
              if (value.isEmpty) {
                return 'First name is required';
              }
              return null;
            },
          ),
          verticalSpace(16),
          CustomTextFormField(
            controller: context.read<AuthCubit>().registerLastNameController,
            hintText: 'Last Name',
            onTap: () {},
            prefixIcon: const Icon(MyFlutterApp.profileicon),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Last name is required';
              }
              return null;
            },
          ),
          verticalSpace(16),
          CustomTextFormField(
            controller: context.read<AuthCubit>().registerEmailController,
            validator: (String value) {
              if (value.isEmpty || !AppRegex.isEmailValid(value)) {
                return 'Email is required';
              }
              return null;
            },
            hintText: 'E-mail ID',
            onTap: () {},
            prefixIcon: const Icon(MyFlutterApp.emailicon),
          ),
          verticalSpace(16),
          CustomTextFormField(
            controller: context.read<AuthCubit>().registerPhoneNumberController,
            validator: (String value) {
              if (value.isEmpty || !AppRegex.isEgyptianPhoneValid(value)) {
                return 'Phone number is required';
              }
              return null;
            },
            hintText: 'xxx xxx xxx',
            onTap: () {},
            prefixIcon: const Icon(MyFlutterApp.phoneicon),
          ),
          verticalSpace(16),

          CustomTextFormField(
            controller: passwordController,
            validator: (String value) {
              if (value.isEmpty) {
                return 'Password is required';
              }
              return null;
            },
            hintText: 'Password',
            onTap: () {},
            prefixIcon: const Icon(MyFlutterApp.passwordicon),
          ),
          verticalSpace(16),
          CustomTextFormField(
            controller: context
                .read<AuthCubit>()
                .registerConfirmPasswordController,
            validator: (String value) {
              if (value.isEmpty) {
                return 'Confirm password is required';
              }
              if (value != passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
            hintText: 'Confirm Password',
            onTap: widget.doneOnConfirmPasswordTovalidateThenLogin,
            prefixIcon: const Icon(MyFlutterApp.passwordicon),
          ),
          verticalSpace(16),
          PasswordValidations(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasNumber: hasNumber,
            hasSpecialCharacter: hasSpecialCharacter,
            hasMinLength: hasMinLength,
          ),
          verticalSpace(30),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
