import 'package:dartz/dartz.dart';
import 'package:products_challenge/core/nothing.dart';
import 'package:products_challenge/features/auth/register/domain/entities/register_user_entity.dart';

abstract class RegisterUserRepository {
  Future<Either<Exception, Nothing>> register({
    required RegisterUserEntity userEntity,
  });
}
