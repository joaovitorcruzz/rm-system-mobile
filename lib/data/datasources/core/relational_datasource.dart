import 'package:rm_systems_mobile/core/service/clock_helper.dart';
import 'package:rm_systems_mobile/core/service/storage_service.dart';
import 'package:rm_systems_mobile/data/datasources/core/i_relational_data_source.dart';


class RelationalDataSource implements IRelationalDataSource {
  final IStorageService _storageService;
  final IClockHelper _clockHelper;

  RelationalDataSource(this._storageService, this._clockHelper);

  @override
  Future<bool>? delete(String tableName, {String? where, List<dynamic>? whereArgs}) async => false;

  @override
  Future<List<Map<String, dynamic>>>? getAtSQL(String tableName, {String? where, List<dynamic>? whereArgs, String? orderBy}) async => [];

  @override
  Future<List<Map<String, dynamic>>>? rawQuery(String sql) async => [];

  @override
  Future<bool>? insert(String tableName, Map<String, dynamic> map) async => false;

  @override
  Future<bool>? insertList(String tableName, List<Map<String, dynamic>> listMap, [bool deleteOld = true]) async => false;

  @override
  Future<bool>? update(String tableName, Map<String, dynamic> map, {String? where, List<dynamic>? whereArgs}) async => false;

  @override
  Future<bool>? rawUpdate(String tableName, String setAtributes, {String? where, List<dynamic>? whereArgs}) async => false;

  @override
  Future<bool>? rawDelete(String sql, [List<Object?>? arguments]) async => false;

  @override
  Future<bool>? deleteTables([bool deleteAll = false]) async => false;

  @override
  DateTime? get currentDateTime => _clockHelper.currentDateTime;
}
