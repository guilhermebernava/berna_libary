import 'package:berna_libary/commons/domain/entities/core_playlist.dart';
import 'package:berna_libary/design/colors/app_colors.dart';
import 'package:berna_libary/modules/playlist/presenters/widgets/music_button.dart';
import 'package:berna_libary/modules/playlist/presenters/widgets/musics.dart';
import 'package:berna_libary/modules/playlist/presenters/widgets/play_music_button.dart';
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
      bottomSheet: Container(
        color: AppColors.grey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const LinearProgressIndicator(
              value: 0.4,
              backgroundColor: AppColors.grey,
              color: AppColors.primary,
              semanticsLabel: 'Linear progress indicator',
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MusicButton(
                    icon: Icons.keyboard_double_arrow_left,
                    onTap: () {},
                  ),
                  PlayMusicButton(onTap: () {}),
                  MusicButton(
                    icon: Icons.keyboard_double_arrow_right,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
