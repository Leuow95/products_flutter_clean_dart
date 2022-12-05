import 'package:dio/dio.dart';
import 'package:products_challenge/core/nothing.dart';
import 'package:products_challenge/features/auth/register/infra/datasources/register_user_datasource.dart';
import 'package:products_challenge/features/auth/register/infra/models/register_user_model.dart';
import 'package:products_challenge/utils/datasource_constants.dart';

class RegisterUserDataSourceImpl implements RegisterUserDataSource {
  final Dio dio;

  RegisterUserDataSourceImpl(this.dio);
  @override
  Future<Nothing> registerUser({
    required RegisterUserModel userModel,
  }) async {
    await dio.post(
      ApiConstants.baseUrl + ApiConstants.register,
      queryParameters: userModel.toJson(),
    );
    return const Nothing();
  }
}
