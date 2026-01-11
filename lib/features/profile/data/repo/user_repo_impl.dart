import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fintech_app/core/constant/app_constant.dart';
import 'package:fintech_app/core/helpers/shared_pref.dart';
import 'package:fintech_app/core/networking/api_error_handler.dart';
import 'package:fintech_app/core/networking/api_error_model.dart';
import 'package:fintech_app/core/networking/api_reuslt.dart';
import 'package:fintech_app/features/auth/data/model/user_model.dart';
import 'package:fintech_app/features/profile/presentation/repo/user_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepoImpl implements UserRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<ApiReuslt<UserModel>> getCurrentUser() async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) {
        return const ApiReuslt.failure(
          ApiErrorModel(message: "User not found"),
        );
      }
      final data = await _firestore
          .collection(AppConstant.userCollection)
          .doc(currentUser.uid)
          .get();

      if (!data.exists) {
        return const ApiReuslt.failure(
          ApiErrorModel(message: "User not found"),
        );
      }
      final userData = Map<String, dynamic>.from(data.data()!);
      userData['uid'] = currentUser.uid;
      return ApiReuslt.success(UserModel.fromJson(userData));
    } catch (error) {
      return ApiReuslt.failure(ApiErrorModel(message: error.toString()));
    }
  }

  @override
  Future<ApiReuslt<void>> updatedUserProfile({
    required String uId,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? profileImage,
  }) async {
    try {
      final Map<String, dynamic> profileUpdate = {};
      if (firstName != null) profileUpdate['firstName'] = firstName;
      if (lastName != null) profileUpdate['lastName'] = lastName;
      if (phoneNumber != null) profileUpdate['phoneNumber'] = phoneNumber;
      if (profileImage != null) profileUpdate['profileImage'] = profileImage;
      if (profileUpdate.isEmpty) {
        return const ApiReuslt.success(null);
      }
      await _firestore
          .collection(AppConstant.userCollection)
          .doc(uId)
          .update(profileUpdate);
      return const ApiReuslt.success(null);
    } catch (error) {
      return ApiReuslt.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiReuslt<void>> logout() async {
    try {
      final SharedPref sharedPref = await SharedPref.getInstance();
      await _auth.signOut();
      await sharedPref.clearUserData();
      return const ApiReuslt.success(null);
    } catch (error) {
      return ApiReuslt.failure(ApiErrorHandler.handle(error));
    }
  }
}
