import 'package:berna_libary/core/domain/interfaces/services/i_themes_services.dart';
import 'package:flutter/material.dart';

class ThemesServices implements IThemesServices {
  @override
  bool isDarkTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.brightness == Brightness.dark;
  }
}
