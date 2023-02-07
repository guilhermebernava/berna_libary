import 'package:berna_libary/commons/domain/entities/music.dart';

abstract class MusicStates {}

class PlayingMusic implements MusicStates {
  final Music? music;

  PlayingMusic({
    this.music,
  });
}

class PausedMusic implements MusicStates {}
