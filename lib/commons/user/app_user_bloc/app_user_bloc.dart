import 'package:berna_libary/commons/domain/entities/core_user.dart';
import 'package:berna_libary/commons/domain/extensions/dartz_extension.dart';
import 'package:berna_libary/commons/user/app_user_bloc/app_user_events.dart';
import 'package:berna_libary/commons/user/app_user_bloc/app_user_states.dart';
import 'package:berna_libary/databases/shared_preferences/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppUserBloc extends Bloc<AppUserEvents, AppUserStates> {
  CoreUser? user;
  final userRepo = Modular.get<UserRepository>();

  AppUserBloc() : super(UnloggedUser()) {
    on<LoginUser>((event, emit) async {
      user = event.user;
      final result = await userRepo.loginUser(event.user);

      if (result.isLeft()) {
        return emit(
          AppUserError(
            error: result.left().error,
            message: result.left().repo,
          ),
        );
      }

      emit(LoggedUser(user: event.user));
    });

    on<GetUser>((event, emit) async {
      final user = await userRepo.getUser();

      if (user.isRight()) {
        emit(LoggedUser(user: user.right()));
        return;
      }
      emit(UnloggedUser());
    });

    on<LogoutUser>((event, emit) {
      user = null;
      userRepo.logoutUser();
      emit(UnloggedUser());
    });
  }
}
