import 'package:products_challenge/features/auth/login/domain/repositories/login_repository.dart';
import 'package:products_challenge/features/auth/login/infra/datasource/login_datasource.dart';
import 'package:products_challenge/features/home/domain/errors/product_failure.dart';
import 'package:dartz/dartz.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource datasource;

  LoginRepositoryImpl(this.datasource);
  @override
  Future<Either<DataSourceError, bool>> login() async {
    try {
      await datasource.login();
      return right(true);
    } catch (e) {
      return left(DataSourceError());
    }
  }
}
