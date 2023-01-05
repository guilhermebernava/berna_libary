import 'package:flutter/material.dart';

abstract class ILoginUseCase {
  final GlobalKey<FormState> formKey;

  ILoginUseCase({
    required this.formKey,
  });

  Future<String?> validateFormInputs();
  Future<String?> login();
  void redirectToSignUp();
}
