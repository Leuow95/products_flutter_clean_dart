import 'package:products_challenge/features/auth/register/domain/entities/register_user_entity.dart';

class RegisterUserModel extends RegisterUserEntity {
  RegisterUserModel({
    required String userName,
    required String email,
    required String password,
  }) : super(
          userName: userName,
          email: email,
          password: password,
        );

  factory RegisterUserModel.fromEntity(RegisterUserEntity entity) {
    return RegisterUserModel(
      userName: entity.userName,
      email: entity.email,
      password: entity.password,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'userEmail': email,
      'userPassword': password,
    };
  }
}
