import 'package:fintech_app/core/helpers/flutter_toast.dart';
import 'package:fintech_app/core/routing/routes.dart';
import 'package:fintech_app/core/widgets/custom_loading_dialog.dart';
import 'package:fintech_app/features/auth/logic/cubit/auth_cubit.dart';
import 'package:fintech_app/features/auth/logic/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BiomerticsBlocListner extends StatelessWidget {
  const BiomerticsBlocListner({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          current is BiometricLoading ||
          current is BiometricSuccess ||
          current is BiometricFailure ||
          current is LoginLoading ||
          current is LoginSuccess ||
          current is LoginFailure,
      listener: (context, state) {
        state.whenOrNull(
          biometricLoading: () {
            showLoadingDialog(context);
          },
          biometricSuccess: () async {
            Navigator.of(context, rootNavigator: true).pop();
            await Future.delayed(const Duration(milliseconds: 500));

            if (!context.mounted) return;
            FlutterToast.showFlutterToast(
              message: 'Login Successfully',
              state: ToastStates.success,
              context: context,
            );
            Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
              Routes.homeScreen,
              (route) => false,
            );
          },
          biometricFailure: (message) {
            FlutterToast.showFlutterToast(
              message: message,
              state: ToastStates.error,
              context: context,
            );
          },
          loginLoading: () {},
          loginSuccess: (user) async {
            Navigator.of(context, rootNavigator: true).pop();
            await Future.delayed(const Duration(milliseconds: 500));

            if (!context.mounted) return;
            FlutterToast.showFlutterToast(
              message: 'Login Successfully',
              state: ToastStates.success,
              context: context,
            );
            Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
              Routes.homeScreen,
              (route) => false,
            );
          },
          loginFailure: (message) {
            Navigator.of(context, rootNavigator: true).pop();
            FlutterToast.showFlutterToast(
              message: message,
              state: ToastStates.error,
              context: context,
            );
          },
        );
      },
      child: child,
    );
  }
}
