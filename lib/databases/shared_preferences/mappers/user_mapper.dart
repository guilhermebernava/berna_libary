import 'dart:convert';
import 'package:berna_libary/commons/domain/entities/core_user.dart';
import 'package:berna_libary/databases/shared_preferences/interfaces/i_user_mapper.dart';

class UserMapper implements IUserMapper {
  @override
  CoreUser fromJson(String source) {
    final map = json.decode(source);

    return CoreUser(
      email: map["email"],
      name: map["name"],
      uuid: map["uuid"],
    );
  }

  @override
  String toJson(CoreUser user) {
    return json.encode({
      "email": user.email,
      "name": user.name,
      "uuid": user.uuid,
    });
  }
}
