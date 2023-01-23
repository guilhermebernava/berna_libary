import 'package:berna_libary/commons/auth/errors/auth_error.dart';
import 'package:berna_libary/commons/domain/entities/core_user.dart';
import 'package:berna_libary/commons/domain/extensions/dartz_extension.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../mocks/auth_use_case_mock.dart';

void main() {
  final useCase = AuthUseCaseMock();

  setUp(() {
    //CORRECT
    when(() => useCase.login(email: "a@a.com", password: "123")).thenAnswer(
      (_) async => Right(
          CoreUser(email: "a@a.com", name: "a", uuid: "", userPlaylists: [])),
    );
    when(() => useCase.createUser(email: "a@a.com", password: "123"))
        .thenAnswer((_) async => Right(CoreUser(
            email: "a@a.com", name: "a", uuid: "", userPlaylists: [])));
    when(() => useCase.resetPassword(email: "a@a.com"))
        .thenAnswer((_) async => const Right(null));

    //ERRORS
    when(() => useCase.login(email: "", password: "")).thenAnswer(
      (_) async => Left(
          AuthError(error: "invalid email or password", message: "message")),
    );
    when(() => useCase.createUser(email: "", password: "")).thenAnswer(
      (_) async =>
          Left(AuthError(error: "error in create user", message: "message")),
    );
    when(() => useCase.resetPassword(email: "")).thenAnswer(
      (_) async => Left(
          AuthError(error: "this user does not exist", message: "message")),
    );
  });

  group("CORRECTS", () {
    test('It should have success when try to login', () async {
      final result = await useCase.login(email: "a@a.com", password: "123");
      expect(result.isRight(), true);
    });

    test('It should have success when try to create user', () async {
      final result =
          await useCase.createUser(email: "a@a.com", password: "123");
      expect(result.isRight(), true);
    });

    test('It should have success when try to reset password', () async {
      final result = await useCase.resetPassword(email: "a@a.com");
      expect(result.isRight(), true);
    });
  });

  group("ERRORS", () {
    test('It should have an error when try to login with invalid user',
        () async {
      final result = await useCase.login(email: "", password: "");
      expect(result.isLeft(), true);
      expect(result.left().error, "invalid email or password");
    });

    test(
        'It should have an error when try to create with invalid email or password',
        () async {
      final result = await useCase.createUser(email: "", password: "");
      expect(result.isLeft(), true);
      expect(result.left().error, "error in create user");
    });

    test('It should have an error when try to reset password with invalid user',
        () async {
      final result = await useCase.resetPassword(email: "");
      expect(result.isLeft(), true);
      expect(result.left().error, "this user does not exist");
    });
  });
}
