import 'package:audioplayers/audioplayers.dart';
import 'package:berna_libary/design/colors/app_colors.dart';
import 'package:berna_libary/modules/playlist/blocs/music_bloc/music_bloc.dart';
import 'package:berna_libary/modules/playlist/blocs/music_bloc/music_events.dart';
import 'package:berna_libary/modules/playlist/blocs/music_bloc/music_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PlayMusicButton extends StatefulWidget {
  final AudioPlayer audioPlayer;
  final VoidCallback onTap;

  const PlayMusicButton({
    super.key,
    required this.onTap,
    required this.audioPlayer,
  });

  @override
  State<PlayMusicButton> createState() => _PlayMusicButtonState();
}

class _PlayMusicButtonState extends State<PlayMusicButton> {
  final musicBloc = Modular.get<MusicBloc>();

  @override
  Widget build(BuildContext context) {
    //TODO criar animacao
    return BlocBuilder(
      bloc: musicBloc,
      builder: (_, state) {
        if (state is PausedMusic) {
          return GestureDetector(
            onTap: () async {
              await widget.audioPlayer.play(
                AssetSource("musics/teste.mp3"),
              );
              musicBloc.add(PlayMusic());
            },
            child: const Icon(
              Icons.play_arrow,
              size: 50,
              color: AppColors.white,
            ),
          );
        }

        if (state is PlayingMusic) {
          return GestureDetector(
            onTap: () async {
              await widget.audioPlayer.pause();
              musicBloc.add(PauseMusic());
            },
            child: const Icon(
              Icons.pause,
              size: 50,
              color: AppColors.white,
            ),
          );
        }
        return Container();
      },
    );
  }
}
