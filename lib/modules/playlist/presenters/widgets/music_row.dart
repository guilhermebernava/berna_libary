import 'package:berna_libary/commons/domain/entities/music.dart';
import 'package:berna_libary/design/colors/app_colors.dart';
import 'package:berna_libary/modules/playlist/design/playlist_fonts.dart';
import 'package:flutter/material.dart';

class MusicRow extends StatelessWidget {
  final Music music;
  final Size size;
  final bool isSelected;
  final VoidCallback onTap;

  const MusicRow({
    super.key,
    required this.music,
    required this.size,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12, left: 20),
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                music.image,
                width: 60,
                height: 60,
              ),
              isSelected
                  ? const Icon(
                      Icons.music_note,
                      color: AppColors.primary,
                      size: 30,
                    )
                  : Container(),
              SizedBox(
                width: size.width * 0.52,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      music.name,
                      style: PlaylistFonts.musicTitle,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${music.author} ${music.album}",
                      style: PlaylistFonts.musicSubtitle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {
                    //TODO adicionar tela de opções
                  },
                  child: const Icon(
                    Icons.more_horiz_rounded,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
