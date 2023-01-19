import 'package:berna_libary/modules/home/design/app_home_fonts.dart';
import 'package:berna_libary/modules/home/domain/entities/playlist.dart';
import 'package:berna_libary/modules/home/presenters/widgets/home_page_widgets/home_big_container/home_big_container.dart';
import 'package:flutter/material.dart';

class HomeBigContainers extends StatelessWidget {
  final List<Playlist> playlists;
  final String title;
  final Size size;

  const HomeBigContainers({
    super.key,
    required this.playlists,
    required this.size,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12, left: 20),
            child: Text(
              title,
              style: AppHomeFonts.homeAppBar,
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            height: size.height * 0.3,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: playlists.length,
              itemBuilder: (context, index) => HomeBigContainer(
                key: ValueKey(playlists[index].image),
                size: size,
                playlist: playlists[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
