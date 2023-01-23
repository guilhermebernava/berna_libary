import 'package:berna_libary/commons/domain/entities/core_playlist.dart';
import 'package:berna_libary/commons/presenters/widgets/core_button_opacity/core_button_opacity.dart';
import 'package:berna_libary/design/colors/app_colors.dart';
import 'package:berna_libary/modules/home/design/app_home_fonts.dart';
import 'package:flutter/material.dart';

class HomePageContainer extends StatelessWidget {
  final VoidCallback onTap;
  final Size size;
  final CorePlaylist playlist;

  const HomePageContainer({
    super.key,
    required this.onTap,
    required this.size,
    required this.playlist,
  });

  @override
  Widget build(BuildContext context) {
    const height = 50.0;

    return CoreButtonOpacity(
      padding: const EdgeInsets.all(4.0),
      onTap: onTap,
      child: Container(
        width: size.width * 0.5,
        decoration: BoxDecoration(
          color: AppColors.lightBlack,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
              child: Image.asset(
                playlist.image,
                width: size.width * 0.14,
                fit: BoxFit.fill,
                height: height,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  width: size.width * 0.27,
                  child: Text(
                    playlist.name,
                    style: AppHomeFonts.homeContainer,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
