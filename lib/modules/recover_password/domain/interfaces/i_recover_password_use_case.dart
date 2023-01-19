import 'package:berna_libary/commons/auth/interfaces/use_cases/i_auth_use_case.dart';
import 'package:berna_libary/modules/recover_password/domain/model/recover_password_model.dart';
import 'package:flutter/material.dart';

abstract class IRecoverPasswordUseCase {
  final RecoverPasswordModel model;
  final IAuthUseCase authUseCase;
  final String loginRoute;

  IRecoverPasswordUseCase({
    required this.authUseCase,
    required this.model,
    required this.loginRoute,
  });

  Future<String?> changePassword(
      GlobalKey<FormState> key, BuildContext context);

  Future<void> redirect();
  void clearEmail();
}
