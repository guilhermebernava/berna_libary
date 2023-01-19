import 'package:berna_libary/commons/value_objects/email.dart';
import 'package:berna_libary/commons/value_objects/password.dart';

class LoginModel {
  final Email email;
  final Password password;

  LoginModel({
    required this.email,
    required this.password,
  });

  factory LoginModel.empty() {
    return LoginModel(
      email: Email(),
      password: Password(),
    );
  }
}
