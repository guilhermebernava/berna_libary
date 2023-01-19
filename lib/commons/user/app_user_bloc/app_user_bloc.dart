import 'package:berna_libary/commons/domain/entities/core_user.dart';
import 'package:berna_libary/commons/user/app_user_bloc/app_user_events.dart';
import 'package:berna_libary/commons/user/app_user_bloc/app_user_states.dart';
import 'package:berna_libary/databases/shared_preferences/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppUserBloc extends Bloc<AppUserEvents, AppUserStates> {
  CoreUser? user;
  final userRepo = Modular.get<UserRepository>();

  AppUserBloc(CoreUser? user)
      : super(user != null ? LoggedUser(user: user) : UnloggedUser()) {
    on<LoginUser>((event, emit) async {
      user = event.user;
      userRepo.loginUser(event.user);
      emit(LoggedUser(user: event.user));
    });

    on<LogoutUser>((event, emit) {
      user = null;
      userRepo.logoutUser();
      emit(UnloggedUser());
    });
  }
}
