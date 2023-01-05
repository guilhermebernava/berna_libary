import 'package:berna_libary/modules/login/domain/interfaces/i_login_use_case.dart';
import 'package:flutter/material.dart';

class LoginUseCase implements ILoginUseCase {
  @override
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Future<String?> login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<String?> validateFormInputs() async {
    final isValid = formKey.currentState?.validate();
    print("validei");

    if (!isValid!) {
      return null;
    }

    //return await login();
    return null;
  }

  @override
  void redirectToSignUp() {
    print("cliquei");
  }
}
