import 'package:berna_libary/commons/presenters/widgets/core_button_opacity/core_button_opacity.dart';
import 'package:berna_libary/design/colors/app_colors.dart';
import 'package:berna_libary/modules/home/domain/entities/playlist.dart';
import 'package:berna_libary/modules/home/presenters/widgets/home_page_widgets/home_big_container/home_big_container_text.dart';
import 'package:flutter/material.dart';

class HomeBigContainer extends StatelessWidget {
  final Size size;
  final Playlist playlist;

  const HomeBigContainer({
    super.key,
    required this.size,
    required this.playlist,
  });

  @override
  Widget build(BuildContext context) {
    return CoreButtonOpacity(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      onTap: () {
        playlist.redirectTo(true);
      },
      child: Column(
        children: [
          Container(
            width: size.width * 0.4,
            height: size.height * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.primary,
              image: DecorationImage(
                fit: BoxFit.fill,
                filterQuality: FilterQuality.high,
                image: AssetImage(
                  playlist.image,
                ),
              ),
            ),
          ),
          HomeBigContainerText(
            text: playlist.name,
            size: size,
          ),
          HomeBigContainerText(
            text: playlist.authorType,
            size: size,
            isBold: false,
          ),
        ],
      ),
    );
  }
}
