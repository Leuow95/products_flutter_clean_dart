import 'package:dartz/dartz.dart';
import 'package:products_challenge/core/nothing.dart';
import 'package:products_challenge/features/auth/register/domain/entities/register_user_entity.dart';
import 'package:products_challenge/features/auth/register/domain/errors/register_user_errors.dart';
import 'package:products_challenge/features/auth/register/domain/repositories/register_repository.dart';

abstract class RegisterUseCase {
  Future<Either<Exception, Nothing>> call(
      {required String userName,
      required String email,
      required String password});
}

class RegisterUseCaseImpl implements RegisterUseCase {
  final RegisterRepository repository;

  RegisterUseCaseImpl(this.repository);
  @override
  Future<Either<RegisterFailure, Nothing>> call({
    required String userName,
    required String email,
    required String password,
  }) async {
    await repository.register(
      user: RegisterUserEntity(
        userName: userName,
        email: email,
        password: password,
      ),
    );
    return right(const Nothing());
  }
}
