import 'package:berna_libary/commons/domain/entities/music.dart';
import 'package:berna_libary/commons/domain/enums/e_playlist_type.dart';

class CorePlaylist {
  final String id;
  final String name;
  final String image;
  final String author;
  final EPlaylistType type;
  final List<Music> musics;

  CorePlaylist({
    required this.musics,
    required this.name,
    required this.id,
    required this.author,
    required this.image,
    required this.type,
  });
}
