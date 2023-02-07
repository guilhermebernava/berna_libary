import 'package:berna_libary/commons/domain/entities/music.dart';
import 'package:berna_libary/modules/playlist/blocs/music_bloc/music_events.dart';
import 'package:berna_libary/modules/playlist/blocs/music_bloc/music_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MusicBloc extends Bloc<MusicEvents, MusicStates> {
  Music? music;

  MusicBloc() : super(PausedMusic()) {
    on<PlayMusic>((event, emit) {
      music = event.music;
      emit(PlayingMusic(music: event.music));
    });
    on<PauseMusic>(
      (event, emit) => emit(
        PausedMusic(),
      ),
    );
  }
}
