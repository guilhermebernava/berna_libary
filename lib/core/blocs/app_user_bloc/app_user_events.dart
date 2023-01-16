import 'package:berna_libary/core/domain/entities/core_user.dart';

abstract class AppUserEvents {}

class LoginUser implements AppUserEvents {
  final CoreUser user;

  LoginUser({
    required this.user,
  });
}

class LogoutUser implements AppUserEvents {}
