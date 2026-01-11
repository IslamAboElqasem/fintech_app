import 'package:bloc/bloc.dart';
import 'package:fintech_app/core/networking/api_reuslt.dart';
import 'package:fintech_app/features/profile/logic/cubit/user_state.dart';
import 'package:fintech_app/features/profile/presentation/repo/user_repo.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userRepo) : super(const UserState.initial());
  final UserRepo userRepo;
  Future<void> getCurrentUser() async {
    emit(const UserState.loading());

    final getCurrentUser = await userRepo.getCurrentUser();
    getCurrentUser.when(
      success: (user) => emit(UserState.loaded(user)),
      failure: (error) => emit(UserState.error(error.message!)),
    );
  }

  Future<void> updateUserProfile({
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? profileImage,
  }) async {
    final currentState = state;
    if (currentState is! Loaded) {
      emit(const UserState.error('No user data available'));
      return;
    }
    final currentUser = currentState.user;
    emit(const UserState.loading());
    final result = await userRepo.updatedUserProfile(
      uId: currentUser.uid,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      profileImage: profileImage,
    );

    result.when(
      success: (_) async {
        final updateUserResult = await userRepo.getCurrentUser();
        updateUserResult.when(
          success: (updatedUser) {
            emit(UserState.updateSuccess(updatedUser));
            emit(UserState.loaded(updatedUser));
          },
          failure: (error) {
            emit(
              UserState.updateFailure(
                error.message ?? 'Update succeeded but failed to reload user',
              ),
            );
          },
        );
      },
      failure: (error) {
        emit(
          UserState.updateFailure(
            error.message ?? 'Failed to update profile',
          ),
        );
        // Restore previous user data
        emit(UserState.loaded(currentUser));
      },
    );
  }

  Future<void> logout() async {
    emit(const UserState.loggingOut());
    final result = await userRepo.logout();
    result.when(
      success: (_) {
        emit(const UserState.logoutSuccess());
      },
      failure: (error) =>
          emit(UserState.logoutFailure(error.message ?? 'Failed logout')),
    );
  }
}
