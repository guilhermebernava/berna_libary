import 'package:flutter_modular/flutter_modular.dart';

class NavigateServices {
  static void navigateRouteOutlet(String route) {
    Modular.to.navigate(".$route");
  }

  static void navigateWithReturn(String route) {
    Modular.to.pushNamed(".$route");
  }
}
