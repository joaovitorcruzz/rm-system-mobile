import 'package:rm_systems_mobile/data/datasources/core/data_source.dart';
import 'package:rm_systems_mobile/domain/entities/core/http_response_entity.dart';
import 'package:rm_systems_mobile/core/service/http_service.dart';

class RemoteDataSource implements IRemoteDataSource {
  final IHttpService _httpService;

  RemoteDataSource(this._httpService);

  @override
  Future<HttpResponseEntity<T>> get<T>(String url) {
    return _httpService.get<T>(url);
  }

  @override
  Future<HttpResponseEntity<T>> post<T>(String url, [String? data]) {
    return _httpService.post<T>(url, data: data);
  }

  @override
  String get urlAuthentication => 'https://127.0.0.1/authentication';

  @override
  String get urlRooms => 'https://127.0.0.1/rooms';
  
  @override
  get environment => throw UnimplementedError();
}