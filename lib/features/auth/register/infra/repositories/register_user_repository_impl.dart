import 'package:products_challenge/features/auth/register/domain/entities/register_user_entity.dart';
import 'package:products_challenge/core/nothing.dart';
import 'package:dartz/dartz.dart';
import 'package:products_challenge/features/auth/register/domain/repositories/register_repository.dart';
import 'package:products_challenge/features/auth/register/infra/datasources/register_user_datasource.dart';
import 'package:products_challenge/features/auth/register/infra/errors/register_user_datasource_errors.dart';
import 'package:products_challenge/features/auth/register/infra/models/register_user_model.dart';

class RegisterUserRepositoryImpl implements RegisterUserRepository {
  final RegisterUserDataSource dataSource;

  RegisterUserRepositoryImpl(this.dataSource);
  @override
  Future<Either<RegisterUserDataSourceError, Nothing>> register({
    required RegisterUserEntity userEntity,
  }) async {
    try {
      await dataSource.registerUser(
        userModel: RegisterUserModel.fromEntity(
          userEntity,
        ),
      );
      return right(const Nothing());
    } catch (e) {
      return left(RegisterUserDataSourceError(e.toString()));
    }
  }
}
