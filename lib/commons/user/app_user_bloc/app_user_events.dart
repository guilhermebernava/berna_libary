import 'package:berna_libary/commons/domain/entities/core_user.dart';

abstract class AppUserEvents {}

class LoginUser implements AppUserEvents {
  final CoreUser user;

  LoginUser({
    required this.user,
  });
}

class GetUser implements AppUserEvents {}

class LogoutUser implements AppUserEvents {}
