import 'package:berna_libary/commons/domain/entities/music.dart';
import 'package:berna_libary/modules/playlist/blocs/music_bloc/music_bloc.dart';
import 'package:berna_libary/modules/playlist/blocs/music_bloc/music_events.dart';
import 'package:berna_libary/modules/playlist/blocs/music_bloc/music_states.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  blocTest<MusicBloc, MusicStates>(
    'emits [PlayingMusic]',
    build: () => MusicBloc(),
    act: (bloc) => bloc.add(
      PlayMusic(
        music: Music(
          image: "",
          name: "",
          album: "",
          author: "",
          duration: "",
          releaseDate: DateTime.now(),
          asset: "",
        ),
      ),
    ),
    expect: () => [isA<PlayingMusic>()],
  );

  blocTest<MusicBloc, MusicStates>(
    'emits [PausedMusic] ',
    build: () => MusicBloc(),
    act: (bloc) => bloc.add(
      PauseMusic(),
    ),
    expect: () => [isA<PausedMusic>()],
  );
}
