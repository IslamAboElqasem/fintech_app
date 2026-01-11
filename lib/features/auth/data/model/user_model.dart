import 'package:fintech_app/core/theme/app_images.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String firstName;
  final String lastName;
  final String email;
  final String uid;
  final String phoneNumber;
  final String? profileImage;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.uid,
    required this.phoneNumber,
    this.profileImage,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
  factory UserModel.fromFirebaseUser(dynamic user) {
    return UserModel(
      uid: user.uid,
      firstName: "",
      lastName: "",
      phoneNumber: "",
      email: user.email,
      profileImage: AppImages.profileImage,
    );
  }
}
