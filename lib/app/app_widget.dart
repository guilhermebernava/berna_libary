import 'package:berna_libary/commons/app_theme/app_theme_bloc/app_theme_events.dart';
import 'package:berna_libary/commons/app_theme/app_theme_bloc/app_theme_states.dart';
import 'package:berna_libary/design/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeBloc = Modular.get<Bloc<AppThemeEvents, AppThemeStates>>();

    return BlocBuilder(
      bloc: themeBloc,
      builder: (context, state) {
        if (state is AppThemeSuccess) {
          return MaterialApp.router(
            title: 'Berna Libary',
            themeMode: state.themeMode,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            debugShowCheckedModeBanner: false,
            routeInformationParser: Modular.routeInformationParser,
            routerDelegate: Modular.routerDelegate,
          );
        }

        return MaterialApp(
          home: Container(),
        );
      },
    );
  }
}
