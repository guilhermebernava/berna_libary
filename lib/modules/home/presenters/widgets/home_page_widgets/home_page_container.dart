import 'package:berna_libary/design/colors/app_colors.dart';
import 'package:berna_libary/modules/home/design/app_home_fonts.dart';
import 'package:berna_libary/modules/home/design/home_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePageContainer extends StatelessWidget {
  final VoidCallback onTap;
  final Size size;
  final String imageAsset;
  final String text;

  const HomePageContainer({
    super.key,
    required this.onTap,
    required this.size,
    required this.text,
    this.imageAsset = HomeImages.likedSongs,
  });

  @override
  Widget build(BuildContext context) {
    const height = 50.0;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          HapticFeedback.selectionClick();
          onTap();
        },
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
                  imageAsset,
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
                      text,
                      style: AppHomeFonts.homeContainer,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
