import 'package:berna_libary/commons/domain/entities/core_user.dart';
import 'package:berna_libary/databases/shared_preferences/errors/shared_error.dart';
import 'package:berna_libary/databases/shared_preferences/interfaces/i_user_mapper.dart';
import 'package:dartz/dartz.dart';

abstract class IUserRepository {
  final String key;
  final IUserMapper mapper;

  IUserRepository({
    required this.mapper,
    required this.key,
  });

  Future<Either<SharedError, void>> loginUser(CoreUser user);
  Future<Either<SharedError, void>> logoutUser();
  Future<Either<SharedError, CoreUser>> getUser();
}
