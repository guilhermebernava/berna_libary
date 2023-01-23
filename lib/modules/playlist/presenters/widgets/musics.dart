import 'package:berna_libary/commons/domain/entities/core_playlist.dart';
import 'package:berna_libary/modules/playlist/presenters/widgets/music_row.dart';
import 'package:flutter/material.dart';

class Musics extends StatefulWidget {
  final Size size;
  final CorePlaylist playlist;
  const Musics({
    super.key,
    required this.size,
    required this.playlist,
  });

  @override
  State<Musics> createState() => _MusicsState();
}

class _MusicsState extends State<Musics> {
  int? selected;

  void changeSelected(int index) {
    if (mounted) {
      setState(() {
        selected = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.playlist.musics.length,
      itemBuilder: (_, index) => MusicRow(
        onTap: () {
          changeSelected(index);
          //TODO dar play na musica
        },
        isSelected: index == selected,
        key: UniqueKey(),
        music: widget.playlist.musics[index],
        size: widget.size,
      ),
    );
  }
}
