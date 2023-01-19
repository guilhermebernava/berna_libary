import 'package:berna_libary/commons/user/app_user_bloc/app_user_bloc.dart';
import 'package:berna_libary/commons/user/app_user_bloc/app_user_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SettingsPage extends StatelessWidget {
  final String loginRoute;
  const SettingsPage({
    super.key,
    required this.loginRoute,
  });

  @override
  Widget build(BuildContext context) {
    final userBloc = Modular.get<AppUserBloc>();
    return Scaffold(
      appBar: AppBar(),
      body: ElevatedButton(
        child: const Text("Logout"),
        onPressed: () {
          userBloc.add(LogoutUser());
          Modular.to.navigate(loginRoute);
        },
      ),
    );
  }
}
