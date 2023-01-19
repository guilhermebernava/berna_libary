import 'dart:ui';
import 'package:berna_libary/commons/services/navigate_services.dart';
import 'package:berna_libary/design/colors/app_colors.dart';
import 'package:berna_libary/modules/home/presenters/pages/home_page.dart';
import 'package:berna_libary/modules/home/presenters/pages/playlist_page.dart';
import 'package:berna_libary/modules/home/presenters/pages/search_page.dart';
import 'package:berna_libary/modules/home/presenters/widgets/home_main_page/bottom_bar_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeBottomBar extends StatefulWidget {
  const HomeBottomBar({super.key});

  @override
  State<HomeBottomBar> createState() => _HomeBottomBarState();
}

class _HomeBottomBarState extends State<HomeBottomBar> {
  int _index = 0;

  void listenModular() {
    if (Modular.to.path == "/home${HomePage.route}") {
      updateIndex(0);
    }
    if (Modular.to.path == "/home${SearchPage.route}") {
      updateIndex(1);
    }
    if (Modular.to.path == "/home${PlaylistPage.route}") {
      updateIndex(2);
    }
  }

  void updateIndex(int index) {
    if (mounted) {
      setState(() {
        _index = index;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    Modular.to.addListener(listenModular);
  }

  @override
  void dispose() {
    super.dispose();
    Modular.to.removeListener(listenModular);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5.0,
          sigmaY: 5.0,
        ),
        child: SizedBox(
          height: 70,
          child: Container(
            color: AppColors.black.withOpacity(0.4),
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
                    NavigateServices.navigateRouteOutlet(HomePage.route);
                  },
                ),
                BottomBarIconButton(
                  isSelected: _index == 1,
                  icon: Icons.search_outlined,
                  text: "Search",
                  onTap: () {
                    updateIndex(1);
                    NavigateServices.navigateRouteOutlet(SearchPage.route);
                  },
                ),
                BottomBarIconButton(
                  isSelected: _index == 2,
                  icon: Icons.favorite_rounded,
                  text: "Playlists",
                  onTap: () {
                    updateIndex(2);
                    NavigateServices.navigateRouteOutlet(PlaylistPage.route);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
