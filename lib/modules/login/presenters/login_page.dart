import 'package:berna_libary/core/blocs/app_theme_bloc/app_theme_events.dart';
import 'package:berna_libary/core/blocs/app_theme_bloc/app_theme_states.dart';
import 'package:berna_libary/core/presenters/widgets/core_text_field/core_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatelessWidget {
  final Bloc<AppThemeEvents, AppThemeStates> appBloc = Modular.get();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CoreTextField(
            title: "Email",
            obscureText: true,
          ),
          ElevatedButton(
            onPressed: () {
              appBloc.add(ChangeAppTheme());
            },
            child: Text(
              "MUDAR APARENCIA",
            ),
          )
        ],
      ),
    );
  }
}
