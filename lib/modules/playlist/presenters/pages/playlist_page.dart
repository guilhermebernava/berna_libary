import 'package:audioplayers/audioplayers.dart';
import 'package:berna_libary/commons/domain/entities/core_playlist.dart';
import 'package:berna_libary/modules/playlist/presenters/widgets/music_player_widget.dart';
import 'package:berna_libary/modules/playlist/presenters/widgets/musics.dart';
import 'package:flutter/material.dart';

class PlaylistPage extends StatefulWidget {
  final CorePlaylist playlist;

  const PlaylistPage({
    super.key,
    required this.playlist,
  });

  @override
  State<PlaylistPage> createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  final audioPlayer = AudioPlayer()..setReleaseMode(ReleaseMode.stop);

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: Musics(
        audioPlayer: audioPlayer,
        size: size,
        playlist: widget.playlist,
      ),
      bottomSheet: MusicPlayerWidget(
        audioPlayer: audioPlayer,
        size: size,
      ),
    );
  }
}
