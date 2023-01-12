import 'package:berna_libary/core/value_objects/email.dart';
import 'package:berna_libary/core/value_objects/not_null.dart';
import 'package:berna_libary/core/value_objects/password.dart';

class CreateUserModel {
  final NotNull name;
  final Email email;
  final Password password;
  final Password confirmPassword;

  CreateUserModel({
    required this.confirmPassword,
    required this.email,
    required this.name,
    required this.password,
  });

  factory CreateUserModel.empty() {
    return CreateUserModel(
      confirmPassword: Password(),
      email: Email(),
      name: NotNull(value: ""),
      password: Password(),
    );
  }
}
