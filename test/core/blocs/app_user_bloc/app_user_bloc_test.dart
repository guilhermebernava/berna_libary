import 'package:berna_libary/core/blocs/app_user_bloc/app_user_bloc.dart';
import 'package:berna_libary/core/blocs/app_user_bloc/app_user_events.dart';
import 'package:berna_libary/core/blocs/app_user_bloc/app_user_states.dart';
import 'package:berna_libary/core/domain/entities/core_user.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  blocTest<AppUserBloc, AppUserStates>(
    'emits [LoggedUser] when have an success with LoginUser event',
    build: () => AppUserBloc(),
    act: (bloc) =>
        bloc.add(LoginUser(user: CoreUser(email: "", name: "", uuid: ""))),
    expect: () => [isA<LoggedUser>()],
  );

  blocTest<AppUserBloc, AppUserStates>(
    'emits [UnloggedUser] when have an success with LogoutUser event',
    build: () => AppUserBloc(),
    act: (bloc) => bloc.add(LogoutUser()),
    expect: () => [isA<UnloggedUser>()],
  );
}