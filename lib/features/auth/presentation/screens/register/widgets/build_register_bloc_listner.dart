import 'package:fintech_app/core/helpers/extension.dart';
import 'package:fintech_app/core/helpers/flutter_toast.dart';
import 'package:fintech_app/core/routing/routes.dart';
import 'package:fintech_app/core/widgets/custom_loading_dialog.dart';
import 'package:fintech_app/features/auth/logic/cubit/auth_cubit.dart';
import 'package:fintech_app/features/auth/logic/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildRegisterBlocListner extends StatelessWidget {
  final Widget child;
  const BuildRegisterBlocListner({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          current is RegisterLoading ||
          current is RegisterSuccess ||
          current is RegisterFailure,
      listener: (context, state) {
        state.whenOrNull(
          registerLoading: () => showLoadingDialog(context),
          registerSuccess: (user) async {
            Navigator.of(context, rootNavigator: true).pop();
            await Future.delayed(const Duration(milliseconds: 500));
            if (!context.mounted) return;
            FlutterToast.showFlutterToast(
              message: 'Register Successfully',
              state: ToastStates.success,
              context: context,
            );
            context.pushNamedAndRemoveUntil(
              Routes.loginScreen,
              (route) => false,
            );
          },
          registerFailure: (message) {
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
