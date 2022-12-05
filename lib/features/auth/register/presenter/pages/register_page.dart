import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:products_challenge/components/drawer.dart';
import 'package:products_challenge/features/auth/register/domain/usecases/register_usecase.dart';
import 'package:products_challenge/features/auth/register/external/register_user_api_datasource_impl.dart';
import 'package:products_challenge/features/auth/register/infra/repositories/register_user_repository_impl.dart';
import 'package:products_challenge/features/auth/register/presenter/controller/register_page_controller.dart';

class RegisterUserPage extends StatefulWidget {
  const RegisterUserPage({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterUserPage> createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  late final RegisterController registerController;
  final _formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    registerController = RegisterController(RegisterUseCaseImpl(
        RegisterUserRepositoryImpl(RegisterUserDataSourceImpl(Dio()))));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: userNameController,
                  autofocus: true,
                  decoration: InputDecoration(
                      hintText: 'What\'s your Username?',
                      labelText: 'Username',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: 'What\'s your email?',
                      labelText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: passwordController,
                  decoration: InputDecoration(
                      hintText: 'Type your password?',
                      labelText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                ElevatedButton(
                  onPressed: () {
                    registerController.registerUseCase(
                        userName: userNameController.text,
                        email: emailController.text,
                        password: passwordController.text);
                  },
                  child: const Text("Registrar"),
                ),
              ],
            ),
          )),
    );
  }
}
