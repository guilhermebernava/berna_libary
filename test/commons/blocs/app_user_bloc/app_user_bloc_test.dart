import 'package:berna_libary/commons/domain/entities/core_user.dart';
import 'package:berna_libary/commons/user/app_user_bloc/app_user_bloc.dart';
import 'package:berna_libary/commons/user/app_user_bloc/app_user_events.dart';
import 'package:berna_libary/commons/user/app_user_bloc/app_user_states.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  blocTest<AppUserBloc, AppUserStates>(
    'emits [LoggedUser] when have an success with LoginUser event',
    build: () => AppUserBloc(CoreUser(email: "", name: "", uuid: "")),
    act: (bloc) =>
        bloc.add(LoginUser(user: CoreUser(email: "", name: "", uuid: ""))),
    expect: () => [isA<LoggedUser>()],
  );

  blocTest<AppUserBloc, AppUserStates>(
    'emits [UnloggedUser] when have an success with LogoutUser event',
    build: () => AppUserBloc(CoreUser(email: "", name: "", uuid: "")),
    act: (bloc) => bloc.add(LogoutUser()),
    expect: () => [isA<UnloggedUser>()],
  );
}
