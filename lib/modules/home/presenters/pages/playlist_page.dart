import 'package:berna_libary/design/fonts/app_fonts.dart';
import 'package:flutter/material.dart';

class PlaylistPage extends StatelessWidget {
  const PlaylistPage({super.key});

  static const route = "/Playlist";

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
