import 'package:rm_systems_mobile/domain/entities/room/user_entity.dart';
import 'package:rm_systems_mobile/domain/repositories/user_repository.dart';
import 'package:rm_systems_mobile/data/datasources/core/i_relational_data_source.dart';
import 'package:rm_systems_mobile/data/datasources/core/data_source.dart';
import 'package:rm_systems_mobile/domain/entities/core/http_response_entity.dart';
import 'package:rm_systems_mobile/configs/data_base_schema_helper.dart';
import 'package:rm_systems_mobile/core/library/constants.dart';

final class UserRepository implements IUserRepository {
  final IRemoteDataSource remoteDataSource;
  final IRelationalDataSource relationalDataSource;

  UserRepository(this.remoteDataSource, this.relationalDataSource);

  @override
  Future<UserEntity> getUserById(String id) async {
    final maps = await relationalDataSource.getAtSQL(
      DataBaseSchemaHelper.kUser,
      where: '${UserEntity.kKeyId} = ?',
      whereArgs: [id],
    );

    if (maps != null && maps.isNotEmpty) {
      return UserEntity.fromMap(maps.first);
    } else {
      throw Exception('User not found');
    }
  }

  @override
  Future<void> saveUser(UserEntity user) async {
    await relationalDataSource.insert(DataBaseSchemaHelper.kUser, user.toMap());
  }

  /// Método para testes (usado no seu test.dart)
  Future<UserEntity> fetchFromApiAsync() async {
    final url = remoteDataSource.environment.urlUserInformation;
    final HttpResponseEntity response = await remoteDataSource.get(url);

    if (response.statusCode == HttpConstant.kSuccess) {
      final user = UserEntity.fromMap(response.data);
      await relationalDataSource.delete(
        DataBaseSchemaHelper.kUser,
        where: '${UserEntity.kKeyId} = ?',
        whereArgs: [user.id],
      );
      await relationalDataSource.insert(DataBaseSchemaHelper.kUser, user.toMap());
      return user;
    } else {
      throw Exception('Erro ao buscar usuário');
    }
  }
}
