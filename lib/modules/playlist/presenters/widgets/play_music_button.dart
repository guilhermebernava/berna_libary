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
    return BlocBuilder(
      bloc: musicBloc,
      builder: (_, state) {
        return GestureDetector(
          onTap: () async {
            if (state is PausedMusic && musicBloc.music != null) {
              await widget.audioPlayer
                  .play(AssetSource(musicBloc.music!.asset));
              musicBloc.add(PlayMusic(music: musicBloc.music!));
            }
            if (state is PlayingMusic) {
              await widget.audioPlayer.pause();
              musicBloc.add(PauseMusic());
            }
          },
          child: state is PausedMusic
              ? const Icon(
                  Icons.play_arrow,
                  size: 50,
                  color: AppColors.white,
                )
              : const Icon(
                  Icons.pause,
                  size: 50,
                  color: AppColors.white,
                ),
        );
      },
    );
  }
}
