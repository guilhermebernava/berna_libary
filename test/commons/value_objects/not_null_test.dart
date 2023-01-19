import 'package:berna_libary/commons/value_objects/not_null.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("INT", () {
    test('It can not be null INT', () async {
      final value = NotNull<int>(value: 1);

      final isValid = value.validator();
      expect(isValid, null);
    });
  });

  group("STRING", () {
    test('It can not be null STRING', () async {
      final value = NotNull<String>(value: "not empty");

      final isValid = value.validator();
      expect(isValid, null);
    });
  });
}
