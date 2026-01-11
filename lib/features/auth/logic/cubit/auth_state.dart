import 'package:fintech_app/features/auth/data/model/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;

  // REGISTER
  const factory AuthState.registerLoading() = RegisterLoading;
  const factory AuthState.registerSuccess(UserModel user) = RegisterSuccess;
  const factory AuthState.registerFailure(String message) = RegisterFailure;

  // LOGIN
  const factory AuthState.loginLoading() = LoginLoading;
  const factory AuthState.loginSuccess(UserModel user) = LoginSuccess;
  const factory AuthState.loginFailure(String message) = LoginFailure;

  // LOGOUT
  const factory AuthState.logoutLoading() = LogoutLoading;
  const factory AuthState.logoutSuccess() = LogoutSuccess;
  const factory AuthState.logoutFailure(String message) = LogoutFailure;

  // Biometrics
  const factory AuthState.biometricLoading() = BiometricLoading;
  const factory AuthState.biometricSuccess() = BiometricSuccess;
  const factory AuthState.biometricFailure(String message) = BiometricFailure;

  const factory AuthState.changeIconVisibility(bool isPassword) =
      ChangeIconVisibility;
}
