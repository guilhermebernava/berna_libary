import 'package:berna_libary/core/domain/interfaces/use_cases/i_auth_use_case.dart';
import 'package:berna_libary/modules/login/domain/models/login_model.dart';
import 'package:flutter/material.dart';

abstract class ILoginUseCase {
  final GlobalKey<FormState> formKey;
  final String homeRoute;
  final String recoverPasswordRoute;
  final String signUpRoute;
  final LoginModel loginModel;
  final IAuthUseCase authUseCase;

  ILoginUseCase({
    required this.formKey,
    required this.loginModel,
    required this.signUpRoute,
    required this.homeRoute,
    required this.recoverPasswordRoute,
    required this.authUseCase,
  });

  Future<bool?> validateFormInputs();
  Future<bool?> login();
  void redirectToSignUp();
  void redirectToRecoverPassword();
}
