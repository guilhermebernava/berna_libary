import 'dart:ui';
import 'package:berna_libary/design/colors/app_colors.dart';
import 'package:berna_libary/modules/home/presenters/widgets/bottom_bar_icon_button.dart';
import 'package:flutter/material.dart';

class HomeBottomBar extends StatefulWidget {
  const HomeBottomBar({super.key});

  @override
  State<HomeBottomBar> createState() => _HomeBottomBarState();
}

class _HomeBottomBarState extends State<HomeBottomBar> {
  int _index = 0;

  void updateIndex(int index) {
    if (mounted) {
      setState(() {
        _index = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 15.0,
          sigmaY: 15.0,
        ),
        child: Opacity(
          opacity: 0.8,
          child: BottomAppBar(
            color: AppColors.black,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BottomBarIconButton(
                    isSelected: _index == 0,
                    icon: Icons.home_filled,
                    text: "Home",
                    onTap: () {
                      updateIndex(0);
                    },
                  ),
                  BottomBarIconButton(
                    isSelected: _index == 1,
                    icon: Icons.search_outlined,
                    text: "Search",
                    onTap: () {
                      updateIndex(1);
                    },
                  ),
                  BottomBarIconButton(
                    isSelected: _index == 2,
                    icon: Icons.favorite_rounded,
                    text: "Playlists",
                    onTap: () {
                      updateIndex(2);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
