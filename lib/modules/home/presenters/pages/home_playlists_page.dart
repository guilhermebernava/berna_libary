import 'package:berna_libary/design/fonts/app_fonts.dart';
import 'package:flutter/material.dart';

class HomePlaylistsPage extends StatelessWidget {
  const HomePlaylistsPage({super.key});

  static const route = "/home-playlists";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Playlist",
          style: AppFonts.basicFont,
        ),
      ),
    );
  }
}
