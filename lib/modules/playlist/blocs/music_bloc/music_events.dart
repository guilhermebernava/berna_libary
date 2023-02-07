import 'package:berna_libary/commons/domain/entities/music.dart';

abstract class MusicEvents {}

class PlayMusic implements MusicEvents {
  final Music music;

  PlayMusic({
    required this.music,
  });
}

class PauseMusic implements MusicEvents {}

class NextMusic implements MusicEvents {}

class PreviousMusic implements MusicEvents {}
