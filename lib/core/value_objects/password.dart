import 'package:berna_libary/core/value_objects/interfaces/value_object.dart';

class Password implements ValueObject<String> {
  String? _value;
  final _regex = RegExp(r'^[\w-]{6,20}$');

  @override
  String get value => _value ?? "";

  Password({String? value}) : _value = value;

  @override
  String? validator() {
    if (_value == null) {
      return "password could not be null";
    }

    if (_regex.hasMatch(_value!) == false) {
      return "invalid password!";
    }

    return null;
  }

  @override
  void call(String value) {
    _value = value;
  }
}
