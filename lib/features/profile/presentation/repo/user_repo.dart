import 'package:fintech_app/core/networking/api_reuslt.dart';
import 'package:fintech_app/features/auth/data/model/user_model.dart';

abstract class UserRepo {
  Future<ApiReuslt<UserModel>> getCurrentUser();
  Future<ApiReuslt<void>> updatedUserProfile({
    required String uId,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? profileImage,
  });
  Future<ApiReuslt<void>> logout();
}
