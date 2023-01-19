import 'package:berna_libary/commons/value_objects/email.dart';
import 'package:berna_libary/commons/value_objects/password.dart';

class CreateUserModel {
  final Email email;
  final Password password;
  final Password confirmPassword;

  CreateUserModel({
    required this.confirmPassword,
    required this.email,
    required this.password,
  });

  factory CreateUserModel.empty() {
    return CreateUserModel(
      confirmPassword: Password(),
      email: Email(),
      password: Password(),
    );
  }
}
