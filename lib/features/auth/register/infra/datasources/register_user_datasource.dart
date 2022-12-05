import 'package:products_challenge/core/nothing.dart';
import 'package:products_challenge/features/auth/register/infra/models/register_user_model.dart';

abstract class RegisterUserDataSource {
  Future<Nothing> registerUser({
    required RegisterUserModel userModel,
  });
}
