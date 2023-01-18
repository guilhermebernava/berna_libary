import 'package:berna_libary/modules/home/presenters/widgets/home_page_widgets/home_page_container_grid.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const route = "/home";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HomePageContainerGrid(
            size: size,
          )
        ],
      ),
    );
  }
}
