import 'package:berna_libary/modules/playlist/blocs/music_bloc/music_events.dart';
import 'package:berna_libary/modules/playlist/blocs/music_bloc/music_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MusicBloc extends Bloc<MusicEvents, MusicStates> {
  MusicBloc() : super(PausedMusic()) {
    on<PlayMusic>((event, emit) {
      emit(PlayingMusic());
    });
    on<PauseMusic>(
      (event, emit) => emit(
        PausedMusic(),
      ),
    );
  }
}
