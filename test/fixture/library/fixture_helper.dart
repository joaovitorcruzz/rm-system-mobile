import 'dart:convert';

import 'package:rm_systems_mobile/domain/entities/room/user_entity.dart';

import 'fixture_reader.dart';

final class FixtureHelper {
  static const String url = 'https://test.com.br';

  static UserEntity fetchUser() {
    return UserEntity.fromRemoteMap(jsonDecode(fixture('user.json')));
  }

  static Map<String, dynamic> fetchUserRemoteMap() {
    return jsonDecode(fixture('user.json'));
  }
}