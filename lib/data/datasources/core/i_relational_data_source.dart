// lib/data/datasources/core/i_relational_data_source.dart
import 'dart:async';

abstract class IRelationalDataSource {
  Future<bool>? delete(String tableName, {String? where, List<dynamic>? whereArgs});
  Future<List<Map<String, dynamic>>>? getAtSQL(String tableName, {String? where, List<dynamic>? whereArgs, String? orderBy});
  Future<List<Map<String, dynamic>>>? rawQuery(String sql);
  Future<bool>? insert(String tableName, Map<String, dynamic> map);
  Future<bool>? insertList(String tableName, List<Map<String, dynamic>> listMap, [bool deleteOld = true]);
  Future<bool>? update(String tableName, Map<String, dynamic> map, {String? where, List<dynamic>? whereArgs});
  Future<bool>? rawUpdate(String tableName, String setAtributes, {String? where, List<dynamic>? whereArgs});
  Future<bool>? rawDelete(String sql, [List<Object?>? arguments]);
  Future<bool>? deleteTables([bool deleteAll = false]);
  DateTime? get currentDateTime;
}
