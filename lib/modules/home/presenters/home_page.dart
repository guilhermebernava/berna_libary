import 'package:berna_libary/core/blocs/app_user_bloc/app_user_events.dart';
import 'package:berna_libary/core/blocs/app_user_bloc/app_user_states.dart';
import 'package:berna_libary/design/fonts/app_fonts.dart';
import 'package:berna_libary/modules/home/presenters/widgets/home_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Modular.get<Bloc<AppUserEvents, AppUserStates>>();

    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder(
        bloc: bloc,
        builder: (_, state) {
          if (state is LoggedUser) {
            return Center(
              child: Text(
                state.user.email ?? "",
                style: AppFonts.basicFont,
              ),
            );
          }
          return Center(
            child: Text(
              "HOME PAGE",
              style: AppFonts.basicFont,
            ),
          );
        },
      ),
      bottomNavigationBar: const HomeBottomBar(),
    );
  }
}
