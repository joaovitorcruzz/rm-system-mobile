import 'package:rm_systems_mobile/domain/entities/core/http_response_entity.dart';

abstract class IRemoteDataSource {
  Future<HttpResponseEntity<T>> get<T>(String url);
  Future<HttpResponseEntity<T>> post<T>(String url, [String? data]);
  String get urlAuthentication;
  String get urlRooms;

  get environment => null;  // Se precisar implementar um getter com um valor padrão, assim fica correto.
}
