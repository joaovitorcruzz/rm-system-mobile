import 'package:rm_systems_mobile/configs/data_base_schema_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class IStorageService {
  Future<bool>? saveUserToken(String token);
  Future<String?>? loadUserToken();
  Future<bool>? clear([bool deleteAll = false]);
}

class StorageService implements IStorageService {
  final SharedPreferences _sharedPreferences;

  StorageService(this._sharedPreferences);

  @override
  Future<bool> saveUserToken(String token) async {
    return await _sharedPreferences.setString(DataBaseNoSqlSchemaHelper.kUserToken, token);
  }

  @override
  Future<String?> loadUserToken() async {
    return _sharedPreferences.getString(DataBaseNoSqlSchemaHelper.kUserToken);
  }

  @override
  Future<bool> clear([bool deleteAll = false]) async {
    if (deleteAll) return await _sharedPreferences.clear();
    return await _sharedPreferences.remove(DataBaseNoSqlSchemaHelper.kUserToken);
  }
}