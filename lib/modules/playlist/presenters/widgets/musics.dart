import 'package:audioplayers/audioplayers.dart';
import 'package:berna_libary/commons/domain/entities/core_playlist.dart';
import 'package:berna_libary/modules/playlist/blocs/music_bloc/music_bloc.dart';
import 'package:berna_libary/modules/playlist/blocs/music_bloc/music_events.dart';
import 'package:berna_libary/modules/playlist/blocs/music_bloc/music_states.dart';
import 'package:berna_libary/modules/playlist/presenters/widgets/music_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Musics extends StatefulWidget {
  final Size size;
  final CorePlaylist playlist;
  final AudioPlayer audioPlayer;

  const Musics({
    super.key,
    required this.size,
    required this.playlist,
    required this.audioPlayer,
  });

  @override
  State<Musics> createState() => _MusicsState();
}

class _MusicsState extends State<Musics> {
  final musicBloc = Modular.get<MusicBloc>();
  int? selected;

  void changeSelected(int index) {
    if (mounted) {
      setState(() {
        selected = index;
      });
    }
  }

  Future<void> changePaused(int index) async {
    if (mounted && index == selected && musicBloc.state is PlayingMusic) {
      musicBloc.add(PauseMusic());
      await widget.audioPlayer.pause();
      return;
    }

    if (mounted && index == selected) {
      musicBloc.add(PlayMusic(music: widget.playlist.musics[index]));
      await widget.audioPlayer.play(
        AssetSource(widget.playlist.musics[index].asset),
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: musicBloc,
      builder: (_, state) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: widget.playlist.musics.length,
          itemBuilder: (_, index) => MusicRow(
            isPaused: state is PlayingMusic,
            onTap: () async {
              changeSelected(index);
              await changePaused(index);
            },
            isSelected: index == selected,
            key: UniqueKey(),
            music: widget.playlist.musics[index],
            size: widget.size,
          ),
        );
      },
    );
  }
}
