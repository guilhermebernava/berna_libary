import 'package:berna_libary/design/colors/app_colors.dart';
import 'package:berna_libary/design/fonts/app_fonts.dart';
import 'package:berna_libary/modules/home/presenters/widgets/bottom_bar_icon_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "HOME PAGE",
          style: AppFonts.basicFont,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: BottomAppBar(
          elevation: 0,
          color: AppColors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BottomBarIconButton(
                icon: Icons.home_filled,
                text: "Home",
                onTap: () {},
              ),
              BottomBarIconButton(
                icon: Icons.search_outlined,
                text: "Search",
                onTap: () {},
              ),
              BottomBarIconButton(
                icon: Icons.favorite,
                text: "Playlists",
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
