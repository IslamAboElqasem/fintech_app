import 'package:fintech_app/core/networking/api_reuslt.dart';
import 'package:fintech_app/features/auth/data/model/user_model.dart';

abstract class AuthRepo {
  Future<ApiReuslt<UserModel>> register({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String email,
    required String password,
  });

  Future<ApiReuslt<UserModel>> login({
    required String email,
    required String password,
  });
  // Future<UserModel?> getCurrentUser();
  //Future<ApiReuslt<void>> logOut();
}
