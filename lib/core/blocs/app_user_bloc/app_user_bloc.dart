import 'package:berna_libary/core/blocs/app_user_bloc/app_user_events.dart';
import 'package:berna_libary/core/blocs/app_user_bloc/app_user_states.dart';
import 'package:berna_libary/core/domain/entities/core_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppUserBloc extends Bloc<AppUserEvents, AppUserStates> {
  CoreUser? user;
  //TODO adicionar shared_preferences

  AppUserBloc() : super(UnloggedUser()) {
    on<LoginUser>((event, emit) async {
      user = event.user;
      emit(LoggedUser(user: event.user));
    });

    on<LogoutUser>((event, emit) {
      user = null;
      emit(UnloggedUser());
    });
  }
}
