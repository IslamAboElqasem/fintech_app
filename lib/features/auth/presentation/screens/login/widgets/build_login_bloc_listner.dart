import 'package:fintech_app/core/helpers/flutter_toast.dart';
import 'package:fintech_app/core/routing/routes.dart';
import 'package:fintech_app/core/widgets/custom_loading_dialog.dart';
import 'package:fintech_app/features/auth/logic/cubit/auth_cubit.dart';
import 'package:fintech_app/features/auth/logic/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildLoginBlocListner extends StatelessWidget {
  const BuildLoginBlocListner({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          current is LoginLoading ||
          current is LoginSuccess ||
          current is LoginFailure,
      listener: (context, state) {
        state.whenOrNull(
          loginLoading: () => showLoadingDialog(context),
          loginSuccess: (user) async {
            Navigator.of(context, rootNavigator: true).pop();
            await Future.delayed(const Duration(milliseconds: 500));

            if (!context.mounted) return;
            showLoadingDialog(context);
            FlutterToast.showFlutterToast(
              message: 'Login Successfully',
              state: ToastStates.success,
              context: context,
            );
            Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
              Routes.homeScreen,
              (route) => false,
              arguments: user.firstName,
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
