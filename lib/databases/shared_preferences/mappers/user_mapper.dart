import 'dart:convert';
import 'package:berna_libary/commons/domain/entities/core_playlist.dart';
import 'package:berna_libary/commons/domain/entities/core_user.dart';
import 'package:berna_libary/databases/shared_preferences/interfaces/i_user_mapper.dart';

class UserMapper implements IUserMapper {
  @override
  CoreUser fromJson(String source) {
    final map = json.decode(source);
    final playlists = <CorePlaylist>[];
    final mapPlaylists = map["user_playlists"];

    for (var playlist in mapPlaylists) {
      playlists.add(playlist);
    }

    return CoreUser(
      email: map["email"],
      name: map["name"],
      uuid: map["uuid"],
      userPlaylists: playlists,
    );
  }

  @override
  String toJson(CoreUser user) {
    return json.encode({
      "email": user.email,
      "name": user.name,
      "uuid": user.uuid,
      "user_playlists": user.userPlaylists,
    });
  }
}
