import 'package:dartz/dartz.dart';
import 'package:products_challenge/features/home/domain/errors/product_failure.dart';

abstract class LoginRepository {
  Future<Either<DataSourceError, bool>> login();
}
