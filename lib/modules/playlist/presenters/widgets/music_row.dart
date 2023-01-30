import 'package:berna_libary/commons/domain/entities/music.dart';
import 'package:berna_libary/design/colors/app_colors.dart';
import 'package:berna_libary/modules/playlist/design/playlist_fonts.dart';
import 'package:flutter/material.dart';

class MusicRow extends StatelessWidget {
  final Music music;
  final Size size;
  final bool isSelected;
  final bool isPaused;
  final VoidCallback onTap;

  const MusicRow({
    super.key,
    required this.music,
    required this.size,
    required this.onTap,
    required this.isSelected,
    required this.isPaused,
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
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    music.image,
                    width: 60,
                    height: 60,
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    color: isSelected
                        ? AppColors.white.withOpacity(0.3)
                        : Colors.transparent,
                    child: isSelected
                        ? isPaused
                            ? const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Icon(
                                  Icons.play_arrow,
                                  color: AppColors.primary,
                                  size: 30,
                                ),
                              )
                            : const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Icon(
                                  Icons.pause,
                                  color: AppColors.primary,
                                  size: 30,
                                ),
                              )
                        : Container(),
                  ),
                ],
              ),
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
                padding: const EdgeInsets.symmetric(horizontal: 10),
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
