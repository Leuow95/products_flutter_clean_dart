import 'package:products_challenge/features/home/domain/errors/product_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:products_challenge/features/login/domain/repositories/login_repository.dart';
import 'package:products_challenge/features/login/infra/datasource/login_datasource.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource datasource;

  LoginRepositoryImpl(this.datasource);
  @override
  Future<Either<DataSourceError, bool>> login() async {
    try {
      final result = await datasource.login();
      return right(result);
    } catch (e) {}
  }
}
