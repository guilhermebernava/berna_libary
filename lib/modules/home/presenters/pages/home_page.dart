import 'package:berna_libary/modules/home/domain/interfaces/i_home_use_case.dart';
import 'package:berna_libary/modules/home/mock/playlists.dart';
import 'package:berna_libary/modules/home/presenters/widgets/home_page_widgets/home_app_bar.dart';
import 'package:berna_libary/modules/home/presenters/widgets/home_page_widgets/home_big_containers.dart';
import 'package:berna_libary/modules/home/presenters/widgets/home_page_widgets/home_future_builder.dart';
import 'package:berna_libary/modules/home/presenters/widgets/home_page_widgets/home_page_container_grid.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final IHomeUseCase useCase;

  const HomePage({
    super.key,
    required this.useCase,
  });

  static const route = "/home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future _future;

  @override
  void initState() {
    super.initState();
    _future = Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: HomeFutureBuilder(
        future: _future,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HomeAppBar(
                useCase: widget.useCase,
                size: size,
              ),
              HomePageContainerGrid(
                useCase: widget.useCase,
                size: size,
                playlists: HomeMockData.containerPlaylists,
              ),
              HomeBigContainers(
                size: size,
                useCase: widget.useCase,
                title: "My Playlists",
                playlists: HomeMockData.containerPlaylists,
              ),
              HomeBigContainers(
                size: size,
                useCase: widget.useCase,
                title: "My Playlists",
                playlists: HomeMockData.containerPlaylists,
              ),
              HomeBigContainers(
                useCase: widget.useCase,
                size: size,
                title: "My Playlists",
                playlists: HomeMockData.containerPlaylists,
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
