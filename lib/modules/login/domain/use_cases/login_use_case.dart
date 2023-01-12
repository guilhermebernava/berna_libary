import 'package:berna_libary/modules/login/domain/interfaces/i_login_use_case.dart';
import 'package:berna_libary/modules/login/domain/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginUseCase implements ILoginUseCase {
  @override
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  String signUpRoute;
  @override
  String homeRoute;
  @override
  String recoverPasswordRoute;
  @override
  LoginModel loginModel = LoginModel.empty();

  LoginUseCase({
    required this.signUpRoute,
    required this.homeRoute,
    required this.recoverPasswordRoute,
  });

  @override
  Future<bool?> login() async {
    await Future.delayed(const Duration(seconds: 3));
    if (loginModel.email.value == "g@g.com" &&
        loginModel.password.value == "123456") {
      Modular.to.navigate(homeRoute);
      return true;
    }
    return false;
  }

  @override
  Future<bool?> validateFormInputs() async {
    final isValid = formKey.currentState?.validate();
    if (!isValid!) {
      return null;
    }

    return await login();
  }

  @override
  void redirectToSignUp() {
    Modular.to.pushNamed(signUpRoute);
  }

  @override
  void redirectToRecoverPassword() {
    Modular.to.pushNamed(recoverPasswordRoute);
  }
}
