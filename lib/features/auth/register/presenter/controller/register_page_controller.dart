import 'package:flutter/material.dart';
import 'package:products_challenge/features/auth/register/domain/usecases/register_usecase.dart';
import 'package:products_challenge/features/auth/register/presenter/controller/register_page_states.dart';
import 'package:products_challenge/features/auth/register/presenter/params/register_user_params.dart';

class RegisterController extends ValueNotifier<RegisterState> {
  final RegisterUseCase registerUseCase;
  RegisterController(
    this.registerUseCase,
  ) : super(RegisterInitialState());

  Future<void> registerUser({
    required RegisterUserParams params,
  }) async {
    value = RegisterLoadingState();

    final eitherResponse = await registerUseCase.call(
      userName: params.userName,
      email: params.email,
      password: params.password,
    );

    eitherResponse.fold(
      (failure) => value = RegisterFailureState(),
      (success) => value = RegisterSuccessState(),
    );
  }
}
