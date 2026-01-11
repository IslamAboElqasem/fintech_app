import 'package:fintech_app/features/auth/data/model/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = _Initial;
  // Get Current User States
  const factory UserState.loading() = Loading;
  const factory UserState.loaded(UserModel user) = Loaded;
  const factory UserState.error(String message) = Error;

  // Update Profile States
  const factory UserState.updating() = Updating;
  const factory UserState.updateSuccess(UserModel user) = UpdateSuccess;
  const factory UserState.updateFailure(String message) = UpdateFailure;

  // Logout States
  const factory UserState.loggingOut() = LoggingOut;
  const factory UserState.logoutSuccess() = LogoutSuccess;
  const factory UserState.logoutFailure(String message) = LogoutFailure;
}
