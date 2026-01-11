import 'package:bloc/bloc.dart';
import 'package:fintech_app/core/helpers/shared_pref.dart';
import 'package:fintech_app/core/networking/api_reuslt.dart';
import 'package:fintech_app/core/services/local_auth_services.dart';
import 'package:fintech_app/features/auth/logic/cubit/auth_state.dart';
import 'package:fintech_app/features/auth/presentation/repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthCubit extends Cubit<AuthState> {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  final TextEditingController registerFirstNameController =
      TextEditingController();
  final TextEditingController registerLastNameController =
      TextEditingController();
  final TextEditingController registerPhoneNumberController =
      TextEditingController();
  final TextEditingController registerEmailController = TextEditingController();
  final TextEditingController registerPasswordController =
      TextEditingController();
  final TextEditingController registerConfirmPasswordController =
      TextEditingController();

  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();

  late final SharedPref sharedPref;

  bool isPassword = true;
  IconData isPasswordIcon = Icons.visibility_off_outlined;

  AuthCubit(this.authRepo, this.authService)
    : super(const AuthState.initial()) {
    _initPref();
  }
  final AuthRepo authRepo;
  final LocalAuthService authService;

  ///! Biometrics
  Future<void> authenticateWithBiometrics() async {
    emit(const AuthState.biometricLoading());
    try {
      final authenticated = await authService.authenticate(
        reason: 'Use biometrics to log in',
      );
      if (authenticated) {
        emit(const AuthState.biometricSuccess());
      } else {
        emit(const AuthState.biometricFailure("Authentication cancelled"));
      }
    } on PlatformException catch (e) {
      emit(
        AuthState.biometricFailure(
          e.message ?? "Biometric authentication failed",
        ),
      );
    }
  }

  // ///! Biometric Login - Direct login for registered users
  // Future<void> loginUsingBiometric() async {
  //   emit(const AuthState.biometricLoading());

  //   final userId = sharedPref.getUserId();
  //   if (userId == null) {
  //     emit(const AuthState.biometricFailure('User not found'));
  //     return;
  //   }
  //   final result = await authRepo.getUserById(userId);
  //   result.when(
  //     success: (user) {
  //       sharedPref.saveUserId(user.uid);
  //       sharedPref.setLoggedIn(true);
  //       sharedPref.saveUserName(user.firstName);
  //       emit(AuthState.loginSuccess(user));
  //     },
  //     failure: (error) {
  //       emit(
  //         AuthState.loginFailure(
  //           error.message ?? 'Login using biomertic failed',
  //         ),
  //       );
  //     },
  //   );
  // }

  ///! iniaiate the shared preferences
  Future<void> _initPref() async {
    sharedPref = await SharedPref.getInstance();
  }

  ///! Register
  Future<void> register() async {
    emit(const AuthState.registerLoading());
    final result = await authRepo.register(
      firstName: registerFirstNameController.text,
      lastName: registerLastNameController.text,
      phoneNumber: registerPhoneNumberController.text,
      email: registerEmailController.text,
      password: registerPasswordController.text,
    );
    result.when(
      success: (user) => emit(AuthState.registerSuccess(user)),
      failure: (error) => emit(AuthState.registerFailure(error.message!)),
    );
  }

  ///! Login
  Future<void> login() async {
    emit(const AuthState.loginLoading());
    final result = await authRepo.login(
      email: loginEmailController.text,
      password: loginPasswordController.text,
    );
    result.when(
      success: (user) async {
        await sharedPref.saveUserId(user.uid);
        await sharedPref.setLoggedIn(true);
        await sharedPref.saveUserName(user.firstName);
        emit(AuthState.loginSuccess(user));
      },
      failure: (error) => emit(AuthState.loginFailure(error.message!)),
    );
  }

  void changeIconVisibility() {
    isPassword = !isPassword;
    isPasswordIcon = isPassword
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
    emit(AuthState.changeIconVisibility(isPassword));
  }
}
