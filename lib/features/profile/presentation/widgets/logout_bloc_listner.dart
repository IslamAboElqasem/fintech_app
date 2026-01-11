import 'package:fintech_app/core/helpers/flutter_toast.dart';
import 'package:fintech_app/core/routing/routes.dart';
import 'package:fintech_app/core/widgets/custom_loading_dialog.dart';
import 'package:fintech_app/features/profile/logic/cubit/user_cubit.dart';
import 'package:fintech_app/features/profile/logic/cubit/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutBlocListenr extends StatelessWidget {
  const LogoutBlocListenr({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        state.whenOrNull(
          loggingOut: () => showLoadingDialog(context),
          logoutSuccess: () {
            Navigator.of(context, rootNavigator: true).pop();
            FlutterToast.showFlutterToast(
              message: 'Logout successfully',
              state: ToastStates.success,
              context: context,
            );
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.authFlow,
              (route) => false,
            );
          },
          logoutFailure: (error) {
            Navigator.pop(context);
            FlutterToast.showFlutterToast(
              message: error,
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
