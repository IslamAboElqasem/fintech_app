import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fintech_app/core/constant/app_constant.dart';
import 'package:fintech_app/core/networking/api_error_handler.dart';
import 'package:fintech_app/core/networking/api_reuslt.dart';
import 'package:fintech_app/features/auth/data/model/user_model.dart';
import 'package:fintech_app/features/auth/presentation/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<ApiReuslt<UserModel>> register({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String email,
    required String password,
  }) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final uid = result.user?.uid;
      final userModel = UserModel(
        uid: uid!,
        email: email,
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
      );
      await _firestore
          .collection(AppConstant.userCollection)
          .doc(uid)
          .set(userModel.toJson());
      return ApiReuslt.success(userModel);
    } catch (error) {
      return ApiReuslt.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiReuslt<UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final uid = result.user?.uid;
      final data = await _firestore
          .collection(AppConstant.userCollection)
          .doc(uid)
          .get();
      return ApiReuslt.success(UserModel.fromJson(data.data()!));
    } catch (error) {
      return ApiReuslt.failure(ApiErrorHandler.handle(error));
    }
  }
}
