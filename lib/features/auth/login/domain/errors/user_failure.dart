abstract class LoginFailure implements Exception {}

class LoginDataSourceError implements LoginFailure {
  final String? message;

  LoginDataSourceError({required this.message});
}
