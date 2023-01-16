import 'package:berna_libary/core/domain/entities/core_user.dart';
import 'package:berna_libary/core/domain/errors/auth_error.dart';
import 'package:berna_libary/core/domain/interfaces/use_cases/i_auth_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthUseCase implements IAuthUseCase {
  @override
  FirebaseAuth auth;
  @override
  FirebaseApp firebaseApp;

  AuthUseCase({
    required this.auth,
    required this.firebaseApp,
  });

  @override
  Future<Either<AuthError, CoreUser>> login(
      {required String email, required String password}) async {
    try {
      final result = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (result.user == null) {
        return Left(
          AuthError(
            error: "no user found",
            message: "no user with email or password",
          ),
        );
      }

      final user = CoreUser(
        email: result.user!.email,
        name: result.user!.displayName,
        uuid: result.user!.uid,
      );

      return Right(user);
    } catch (e) {
      return Left(
        AuthError(
          error: e.toString(),
          message: "Exception in Login",
        ),
      );
    }
  }

  @override
  Future<Either<AuthError, CoreUser>> createUser(
      {required String email, required String password}) async {
    try {
      final result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (result.user == null) {
        return Left(
          AuthError(
            error: "no user found",
            message: "no user with email or password",
          ),
        );
      }
      final user = CoreUser(
        email: result.user!.email,
        name: result.user!.displayName,
        uuid: result.user!.uid,
      );

      return Right(user);
    } catch (e) {
      return Left(
        AuthError(
          error: e.toString(),
          message: "Exception in Create User",
        ),
      );
    }
  }

  @override
  Future<Either<AuthError, void>> resetPassword({
    required String email,
  }) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      return const Right(null);
    } catch (e) {
      return Left(
        AuthError(
          error: e.toString(),
          message: "error in reseting password",
        ),
      );
    }
  }
}
