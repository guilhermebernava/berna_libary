import 'package:berna_libary/core/domain/entities/core_user.dart';

abstract class IUserMapper {
  String toJson(CoreUser user);
  CoreUser fromJson(String source);
}
