import 'dart:async';

import 'package:berna_libary/commons/user/app_user_bloc/app_user_states.dart';
import 'package:berna_libary/commons/user/app_user_bloc/app_user_events.dart';
import 'package:berna_libary/modules/splash/domain/interfaces/i_splash_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashUseCase implements ISplashUseCase {
  @override
  String homeRoute;
  @override
  String loginRoute;
  @override
  Bloc<AppUserEvents, AppUserStates> appUserBloc = Modular.get();
  late StreamSubscription subscription;

  SplashUseCase({
    required this.homeRoute,
    required this.loginRoute,
  });

  void onChangeState(AppUserStates state) {
    if (state is LoggedUser) {
      Modular.to.navigate(homeRoute);
      return;
    }
    Modular.to.navigate(loginRoute);
  }

  @override
  Future<void> redirectToNextPage() async {
    appUserBloc.add(GetUser());
    subscription = appUserBloc.stream.listen(onChangeState);
  }

  @override
  void dispose() {
    subscription.cancel();
  }
}
