import 'package:berna_libary/commons/user/app_user_bloc/app_user_events.dart';
import 'package:berna_libary/commons/user/app_user_bloc/app_user_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class ISplashUseCase implements Disposable {
  final String homeRoute;
  final String loginRoute;
  final Bloc<AppUserEvents, AppUserStates> appUserBloc;

  ISplashUseCase({
    required this.homeRoute,
    required this.loginRoute,
    required this.appUserBloc,
  });

  Future<void> redirectToNextPage();
}
