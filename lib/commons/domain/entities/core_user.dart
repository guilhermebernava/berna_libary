import 'package:berna_libary/commons/domain/entities/core_playlist.dart';

class CoreUser {
  final String? name;
  final String? email;
  final String uuid;
  final List<CorePlaylist> userPlaylists;

  CoreUser({
    required this.email,
    required this.name,
    required this.uuid,
    required this.userPlaylists,
  });
}
