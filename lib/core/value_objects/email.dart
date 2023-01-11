import 'package:berna_libary/core/value_objects/interfaces/value_object.dart';

class Email implements ValueObject<String> {
  String? _value;
  final _regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  @override
  String get value => _value ?? "";

  Email({String? value}) : _value = value;

  @override
  String? validator() {
    if (_value == null) {
      return "email could not be null";
    }

    if (_regex.hasMatch(_value!) == false) {
      return "invalid email!";
    }

    return null;
  }

  @override
  void call(String value) {
    _value = value;
  }
}
