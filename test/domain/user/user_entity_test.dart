import 'package:flutter_test/flutter_test.dart';
import 'package:rm_systems_mobile/domain/entities/room/user_entity.dart';

import '../../fixture/library/fixture_helper.dart';

void main() {
  test('should valid the entity', () {
    // Arrange
    final Map<String, dynamic> userMap = FixtureHelper.fetchUserRemoteMap();

    // Act
    final UserEntity user = UserEntity.fromRemoteMap(userMap);
    final Map<String, dynamic> userCopyMap = user.toMap();

    // Assert
    expect(user.id, isA<String>());
    expect(user.name, isA<String>());
    expect(user.email, isA<String>());
    expect(user.profileImage, isA<String>());
    expect(userCopyMap, isA<Map<String, dynamic>>());
  });
}