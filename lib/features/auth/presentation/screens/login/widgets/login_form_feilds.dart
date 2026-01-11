import 'package:fintech_app/core/helpers/app_regex.dart';
import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/core/icons/my_flutter_app_icons.dart';
import 'package:fintech_app/core/widgets/custom_text_form_field.dart';
import 'package:fintech_app/features/auth/logic/cubit/auth_cubit.dart';
import 'package:fintech_app/features/auth/logic/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginFormFeilds extends StatefulWidget {
  const LoginFormFeilds({
    super.key,
  });

  @override
  State<LoginFormFeilds> createState() => _LoginFormFeildsState();
}

class _LoginFormFeildsState extends State<LoginFormFeilds> {
  late TextEditingController passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    passwordController = context.read<AuthCubit>().loginPasswordController;
    context.read<AuthCubit>().loginFormKey = _formKey;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: context.read<AuthCubit>().loginEmailController,
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
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return CustomTextFormField(
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
                isObscureText: context.read<AuthCubit>().isPassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    context.read<AuthCubit>().changeIconVisibility();
                  },
                  icon: Icon(context.read<AuthCubit>().isPasswordIcon),
                ),
              );
            },
          ),
          verticalSpace(12),
        ],
      ),
    );
  }
}
