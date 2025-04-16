import 'package:rm_systems_mobile/core/service/clock_helper.dart';
import 'package:rm_systems_mobile/core/service/storage_service.dart';
import 'package:rm_systems_mobile/ui/profile/view_models/user_viewmodel.dart';

final class NonRelationalDataSource implements INonRelationalDataSource {
  final IStorageService _storageService;
  final IClockHelper _clockHelper;

  NonRelationalDataSource(this._storageService, this._clockHelper);

  @override
  Future<bool>? saveString(String keyName, String value) => _storageService.saveUserToken(value);

  @override
  Future<bool>? saveMap(String keyName, Map<String, dynamic> map) async => false;

  @override
  Future<bool>? saveInt(String keyName, int value) async => false;

  @override
  Future<bool>? saveDouble(String keyName, double value) async => false;

  @override
  Future<bool>? saveBool(String keyName, bool value) async => false;

  @override
  Future<bool>? saveError(String keyName, String value) async => false;

  @override
  Future<String?>? loadString(String keyName) => _storageService.loadUserToken();

  @override
  Future<Map<String, dynamic>?>? loadMap(String keyName) async => null;

  @override
  Future<int?>? loadInt(String keyName) async => null;

  @override
  Future<double?>? loadDouble(String keyName) async => null;

  @override
  Future<bool?>? loadBool(String keyName) async => null;

  @override
  Future<List<String>>? loadErrors(String keyName) async => [];

  @override
  Future<bool>? remove(String keyName) async => false;

  @override
  Future<bool>? clear([bool deleteAll = false]) => _storageService.clear(deleteAll);

  @override
  DateTime? get currentDateTime => _clockHelper.currentDateTime;
}