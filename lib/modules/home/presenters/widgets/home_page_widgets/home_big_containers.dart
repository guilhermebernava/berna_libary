import 'package:berna_libary/modules/home/domain/entities/playlist.dart';
import 'package:berna_libary/modules/home/presenters/widgets/home_page_widgets/home_big_container/home_big_container.dart';
import 'package:flutter/material.dart';

class HomeBigContainers extends StatelessWidget {
  final List<Playlist> playlists;
  final Size size;

  const HomeBigContainers({
    super.key,
    required this.playlists,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.3,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: playlists.length,
        itemBuilder: (context, index) => HomeBigContainer(
          key: ValueKey(playlists[index].image),
          size: size,
          playlist: playlists[index],
        ),
      ),
    );
  }
}
