import 'package:berna_libary/commons/domain/entities/core_user.dart';

abstract class AppUserStates {}

class LoggedUser implements AppUserStates {
  final CoreUser user;

  LoggedUser({
    required this.user,
  });
}

class UnloggedUser implements AppUserStates {}

class AppUserError implements AppUserStates {
  final String message;
  final String error;

  AppUserError({
    required this.error,
    required this.message,
  });
}
