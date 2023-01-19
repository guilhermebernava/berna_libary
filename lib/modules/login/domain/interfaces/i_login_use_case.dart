import 'package:berna_libary/commons/user/app_user_bloc/app_user_events.dart';
import 'package:berna_libary/commons/user/app_user_bloc/app_user_states.dart';
import 'package:berna_libary/commons/auth/interfaces/use_cases/i_auth_use_case.dart';
import 'package:berna_libary/modules/login/domain/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ILoginUseCase {
  final GlobalKey<FormState> formKey;
  final String homeRoute;
  final String recoverPasswordRoute;
  final String signUpRoute;
  final LoginModel loginModel;
  final Bloc<AppUserEvents, AppUserStates> appUserBloc;
  final IAuthUseCase authUseCase;

  ILoginUseCase({
    required this.formKey,
    required this.loginModel,
    required this.signUpRoute,
    required this.homeRoute,
    required this.recoverPasswordRoute,
    required this.authUseCase,
    required this.appUserBloc,
  });

  Future<bool?> validateFormInputs();
  Future<bool?> login();
  void redirectToSignUp();
  void redirectToRecoverPassword();
}
