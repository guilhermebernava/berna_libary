import 'package:berna_libary/core/domain/interfaces/use_cases/i_auth_use_case.dart';
import 'package:berna_libary/modules/sign_up/domain/model/create_user_model.dart';
import 'package:flutter/material.dart';

abstract class ISignUpUseCase {
  final GlobalKey<FormState> formKey;
  final CreateUserModel model;
  final IAuthUseCase authUseCase;
  final String homeRoute;

  ISignUpUseCase({
    required this.formKey,
    required this.model,
    required this.authUseCase,
    required this.homeRoute,
  });

  Future<String?> validateInputs();
  Future<String?> createUser();
}
