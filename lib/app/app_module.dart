import 'package:berna_libary/core/blocs/app_theme_bloc/app_theme_bloc.dart';
import 'package:berna_libary/core/services/themes_services.dart';
import 'package:berna_libary/modules/home/home_module.dart';
import 'package:berna_libary/modules/login/login_module.dart';
import 'package:berna_libary/modules/recover_password/recover_password_module.dart';
import 'package:berna_libary/modules/sign_up/sign_up_module.dart';
import 'package:berna_libary/modules/splash/domain/use_cases/splash_use_case.dart';
import 'package:berna_libary/modules/splash/presenters/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        BlocBind.singleton(
          (i) => AppThemeBloc(
            ThemeMode.dark,
          ),
        ),
        Bind(
          (i) => SplashUseCase(
            routeTo: LoginModule.moduleRoute,
          ),
        ),
        Bind(
          (i) => ThemesServices(),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => SplashPage(
            bloc: Modular.get(),
            useCase: Modular.get<SplashUseCase>(),
          ),
        ),
        ModuleRoute(
          LoginModule.moduleRoute,
          module: LoginModule(),
          transition: TransitionType.fadeIn,
        ),
        ModuleRoute(
          HomeModule.moduleRoute,
          module: HomeModule(),
          transition: TransitionType.fadeIn,
        ),
        ModuleRoute(
          SignUpModule.moduleRoute,
          module: SignUpModule(),
          transition: TransitionType.fadeIn,
        ),
        ModuleRoute(
          RecoverPasswordModule.moduleRoute,
          module: RecoverPasswordModule(),
          transition: TransitionType.fadeIn,
        )
      ];
}
