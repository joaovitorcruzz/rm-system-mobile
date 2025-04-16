import 'package:flutter_test/flutter_test.dart';
import 'package:rm_systems_mobile/configs/data_base_schema_helper.dart';
import 'package:rm_systems_mobile/configs/environment_helper.dart';
import 'package:rm_systems_mobile/data/datasources/core/data_source.dart';
import 'package:rm_systems_mobile/data/datasources/core/i_relational_data_source.dart';
import 'package:rm_systems_mobile/data/datasources/repositories/user_repository_impl.dart';
import 'package:rm_systems_mobile/domain/entities/core/http_response_entity.dart';
import 'package:rm_systems_mobile/core/library/constants.dart';
import 'package:rm_systems_mobile/domain/entities/room/user_entity.dart';
import 'package:rm_systems_mobile/domain/repositories/user_repository.dart';

import '../../../fixture/library/fixture_helper.dart';
import '../../../fixture/library/mocks.dart';

void main() {
  late final IEnvironmentHelper tEnvironment;
  late final IRemoteDataSource tRemoteDataSource;
  late final IRelationalDataSource tRelationalDataSource;
  late final IUserRepository tUsuarioRepository;
  late final UserEntity tUsuario;
  late final Map<String, dynamic> tUsuarioMap;
  late final String tUrl;

  setUpAll(() {
    tEnvironment = MockEnvironment();
    tRemoteDataSource = MockRemoteDataSource();
    tRelationalDataSource = MockRelationalDataSource();
    tUsuario = FixtureHelper.fetchUser();
    tUsuarioMap = FixtureHelper.fetchUserRemoteMap();
    tUrl = FixtureHelper.url;
    tUsuarioRepository = UserRepository(tRemoteDataSource, tRelationalDataSource);
  });

  test('should return usuario from remote', () async {
      // Arrange
      when(tRemoteDataSource.environment).thenReturn(tEnvironment);
      when(tEnvironment.urlUserInformation).thenReturn(FixtureHelper.url);
      when(tRelationalDataSource.delete(
          DataBaseSchemaHelper.kUser, 
          where: '${UserEntity.kKeyId} = ?',
          whereArgs: [tUsuario.id],
        )
      ).thenAnswer((_) => Future.value(true));
      when(tRelationalDataSource.insert(DataBaseSchemaHelper.kUser, tUsuario.toMap())).thenAnswer((_) => Future.value(true));
      when(tRemoteDataSource.get(tUrl)).thenAnswer((_) async => HttpResponseEntity(statusCode: HttpConstant.kSuccess, data: tUsuarioMap));

      // Act
      final UserEntity usuario = await tUsuarioRepository.fetchFromApiAsync();

      // Assert
      expect(usuario, isNotNull);
      verify(tRemoteDataSource.environment).called(1);
      verify(tEnvironment.urlUserInformation).called(1);
      verify(tRemoteDataSource.get(tUrl)).called(1);
      verify(tRelationalDataSource.delete(
          DataBaseSchemaHelper.kUser, 
          where: '${UserEntity.kKeyId} = ?',
          whereArgs: [tUsuario.id]
        )
      ).called(1);
      verify(tRelationalDataSource.insert(DataBaseSchemaHelper.kUser, tUsuario.toMap())).called(1);
      verifyNoMoreInteractions(tRemoteDataSource);
      verifyNoMoreInteractions(tEnvironment);
      verifyNoMoreInteractions(tEnvironment);
    });
}