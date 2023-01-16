import 'package:berna_libary/core/domain/entities/core_user.dart';
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

  Future<Either<AuthError, CoreUser>> login({
    required String email,
    required String password,
  });

  Future<Either<AuthError, CoreUser>> createUser({
    required String email,
    required String password,
  });

  Future<Either<AuthError, void>> resetPassword({
    required String email,
  });
}
