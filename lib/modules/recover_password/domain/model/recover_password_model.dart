import 'package:berna_libary/commons/value_objects/email.dart';
import 'package:berna_libary/commons/value_objects/not_null.dart';
import 'package:berna_libary/commons/value_objects/password.dart';

class RecoverPasswordModel {
  Email email;
  NotNull token;
  Password password;

  RecoverPasswordModel({
    required this.email,
    required this.password,
    required this.token,
  });

  factory RecoverPasswordModel.empty() {
    return RecoverPasswordModel(
      email: Email(),
      password: Password(),
      token: NotNull(
        value: "",
      ),
    );
  }
}
