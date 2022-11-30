import 'package:dartz/dartz.dart';
import 'package:products_challenge/features/login/domain/errors/user_failure.dart';
import 'package:products_challenge/features/login/domain/repositories/login_repository.dart';

abstract class LoginUsecase {
  Future<Either<LoginDataSourceError, bool>> login();
}

class LoginUsecaseImpl implements LoginUsecase {
  final LoginRepository repository;

  LoginUsecaseImpl(this.repository);
  @override
  Future<Either<LoginDataSourceError, bool>> login() async {
    final eitherResponse = await repository.login();
    return eitherResponse.fold(
      (loginFailure) => right(false),
      (success) => right(true),
    );
  }
}
