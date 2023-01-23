import 'package:berna_libary/commons/domain/entities/core_playlist.dart';
import 'package:berna_libary/modules/home/domain/interfaces/i_home_use_case.dart';
import 'package:berna_libary/modules/home/presenters/widgets/home_page_widgets/home_page_container.dart';
import 'package:flutter/material.dart';

class HomePageContainerGrid extends StatelessWidget {
  final Size size;
  final List<CorePlaylist> playlists;
  final IHomeUseCase useCase;

  const HomePageContainerGrid({
    super.key,
    required this.size,
    required this.playlists,
    required this.useCase,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: playlists.length,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3,
        ),
        itemBuilder: (_, index) => HomePageContainer(
          onTap: () => useCase.redirectToPlaylist(playlists[index]),
          size: size,
          playlist: playlists[index],
        ),
      ),
    );
  }
}
