import 'package:rm_systems_mobile/domain/entities/room/user_entity.dart';

abstract class IUserRepository {
  Future<UserEntity> getUserById(String id);
  Future<void> saveUser(UserEntity user);

  Future<UserEntity> fetchFromApiAsync();
}
