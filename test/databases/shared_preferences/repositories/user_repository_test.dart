import 'package:berna_libary/commons/domain/entities/core_user.dart';
import 'package:berna_libary/commons/domain/extensions/dartz_extension.dart';
import 'package:berna_libary/databases/shared_preferences/mappers/user_mapper.dart';
import 'package:berna_libary/databases/shared_preferences/repositories/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  final mapper = UserMapper();
  final repo = UserRepository(mapper: mapper);

  setUp(() {
    final json = mapper
        .toJson(CoreUser(email: "", name: "gui", uuid: "", userPlaylists: []));
    Map<String, Object> values = <String, Object>{'user': json};
    SharedPreferences.setMockInitialValues(values);
  });

  group("GET", () {
    test('It should get user', () async {
      final result = await repo.getUser();

      expect(result.isRight(), true);
      expect(result.right().name, "gui");
    });

    test('It should have an error when not have an user', () async {
      SharedPreferences.setMockInitialValues({});
      final result = await repo.getUser();

      expect(result.isLeft(), true);
    });
  });

  group("INSERT", () {
    test('It should insert user', () async {
      final result = await repo.loginUser(
          CoreUser(email: "t", name: "t", uuid: "", userPlaylists: []));

      expect(result.isRight(), true);
    });
  });

  group("DELETE", () {
    test('It should logout user', () async {
      final result = await repo.loginUser(
          CoreUser(email: "t", name: "t", uuid: "", userPlaylists: []));
      expect(result.isRight(), true);

      final logout = await repo.logoutUser();
      expect(logout.isRight(), true);
    });
  });
}
