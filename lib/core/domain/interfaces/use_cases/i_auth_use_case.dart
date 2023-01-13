import 'package:berna_libary/core/domain/errors/auth_error.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

abstract class IAuthUseCase {
  final FirebaseApp firebaseApp;
  final FirebaseAuth auth;

  IAuthUseCase({
    required this.auth,
    required this.firebaseApp,
  });

  Future<Either<AuthError, User>> login({
    required String email,
    required String password,
  });

  Future<Either<AuthError, User>> createUser({
    required String email,
    required String password,
  });

  Future<Either<AuthError, void>> sendTokenToEmail({
    required String email,
  });

  Future<Either<AuthError, void>> checkToken({
    required String token,
  });
  Future<Either<AuthError, void>> resetPassword({
    required String token,
    required String password,
  });
}
