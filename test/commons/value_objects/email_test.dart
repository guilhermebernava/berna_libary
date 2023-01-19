import 'package:berna_libary/commons/value_objects/email.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final email = Email();

  test('It should return error when is null', () {
    final isNull = email.validator();
    expect(isNull, isA<String>());
  });

  test('It should have an error when email is invalid', () {
    email.call("aa.com");
    final isNull = email.validator();
    expect(isNull, isA<String>());
  });
}
