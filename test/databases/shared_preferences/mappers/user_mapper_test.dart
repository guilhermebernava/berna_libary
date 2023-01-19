import 'package:berna_libary/commons/domain/entities/core_user.dart';
import 'package:berna_libary/databases/shared_preferences/mappers/user_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final mapper = UserMapper();
  final user = CoreUser(email: "teste", name: "", uuid: "");

  test('It should enconde to JSON', () {
    final json = mapper.toJson(user);
    expect(json, isA<String>());
  });

  test('It should decode from JSON', () {
    final json = mapper.toJson(user);
    expect(json, isA<String>());
    final userFromJson = mapper.fromJson(json);
    expect(userFromJson, isA<CoreUser>());
  });
}
