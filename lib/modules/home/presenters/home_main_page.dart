import 'package:berna_libary/commons/services/navigate_services.dart';
import 'package:berna_libary/modules/home/presenters/pages/home_page.dart';
import 'package:berna_libary/modules/home/presenters/widgets/home_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeMainPage extends StatefulWidget {
  const HomeMainPage({
    super.key,
  });

  @override
  State<HomeMainPage> createState() => _HomeMainPageState();
}

class _HomeMainPageState extends State<HomeMainPage> {
  @override
  void initState() {
    super.initState();
    NavigateServices.navigateRouteOutlet(HomePage.route);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: const RouterOutlet(),
      ),
      bottomNavigationBar: const HomeBottomBar(),
    );
  }
}
