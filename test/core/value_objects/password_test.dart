import 'package:berna_libary/core/value_objects/password.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final password = Password();

  test('It should return error when is null', () async {
    final isNull = password.validator();

    expect(isNull, isA<String>());
  });

  test('It should return error when the logic of password is wrong', () async {
    final isNull = password.validator();

    expect(isNull, isA<String>());
  });
}
