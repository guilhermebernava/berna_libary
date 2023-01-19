import 'package:berna_libary/commons/domain/entities/core_user.dart';
import 'package:berna_libary/databases/shared_preferences/interfaces/i_user_mapper.dart';
import 'package:berna_libary/databases/shared_preferences/errors/shared_error.dart';
import 'package:berna_libary/databases/shared_preferences/interfaces/i_user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository implements IUserRepository {
  @override
  final String key = "user";
  @override
  IUserMapper mapper;

  UserRepository({
    required this.mapper,
  });

  @override
  Future<Either<SharedError, CoreUser>> getUser() async {
    try {
      final shared = await SharedPreferences.getInstance();

      if (!shared.containsKey(key)) {
        return Left(
          SharedError(
            error: "do not contains USER KEY",
            repo: "userRepository",
          ),
        );
      }

      final result = shared.getString(key);

      if (result == null) {
        return Left(
          SharedError(
            error: "do not have an user logged",
            repo: "userRepository",
          ),
        );
      }
      final user = mapper.fromJson(result);

      return Right(user);
    } catch (e) {
      return Left(
        SharedError(error: e.toString(), repo: "userRepository"),
      );
    }
  }

  @override
  Future<Either<SharedError, void>> loginUser(CoreUser user) async {
    try {
      final shared = await SharedPreferences.getInstance();
      final json = mapper.toJson(user);

      final result = await shared.setString(key, json);

      if (!result) {
        return Left(
          SharedError(
            error: "error in putting user into shared_preferences",
            repo: "userRepository",
          ),
        );
      }

      return const Right(null);
    } catch (e) {
      return Left(
        SharedError(error: e.toString(), repo: "userRepository"),
      );
    }
  }

  @override
  Future<Either<SharedError, void>> logoutUser() async {
    try {
      final shared = await SharedPreferences.getInstance();
      final result = await shared.remove(key);

      if (!result) {
        return Left(
          SharedError(
            error: "error in removing user",
            repo: "userRepository",
          ),
        );
      }

      return const Right(null);
    } catch (e) {
      return Left(
        SharedError(error: e.toString(), repo: "userRepository"),
      );
    }
  }
}
