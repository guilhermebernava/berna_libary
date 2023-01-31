import 'package:berna_libary/commons/domain/entities/core_playlist.dart';
import 'package:berna_libary/modules/playlist/presenters/widgets/music_player_widget.dart';
import 'package:berna_libary/modules/playlist/presenters/widgets/musics.dart';
import 'package:flutter/material.dart';

class PlaylistPage extends StatelessWidget {
  final CorePlaylist playlist;

  const PlaylistPage({
    super.key,
    required this.playlist,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: Musics(
        size: size,
        playlist: playlist,
      ),
      bottomSheet: MusicPlayerWidget(
        size: size,
      ),
    );
  }
}
