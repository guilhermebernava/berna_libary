import 'package:berna_libary/modules/sign_up/domain/model/create_user_model.dart';
import 'package:flutter/material.dart';

abstract class ISignUpUseCase {
  final GlobalKey<FormState> formKey;
  final CreateUserModel model;

  ISignUpUseCase({
    required this.formKey,
    required this.model,
  });

  Future<String?> validateInputs();
  Future<String?> createUser();
}
