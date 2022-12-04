class RegisterFailure implements Exception {
  final String? message;

  RegisterFailure({
    required this.message,
  });
}
