import 'package:dio/dio.dart';
import 'package:rm_systems_mobile/domain/entities/core/http_response_entity.dart';

abstract interface class IHttpService {
  Future<HttpResponseEntity<T>> get<T>(String url);
  Future<HttpResponseEntity<T>> post<T>(String url, {dynamic data});
  Future<List<dynamic>> fetchRooms();  // Adicionando o método aqui
}

final class HttpService implements IHttpService {
  final Dio _dio;

  const HttpService(this._dio);

  @override
  Future<HttpResponseEntity<T>> get<T>(String url) async {
    try {
      final Response response = await _dio.get(url);
      return HttpResponseEntity<T>(
        data: response.data,
        statusCode: response.statusCode,
      );
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  @override
  Future<HttpResponseEntity<T>> post<T>(String url, {dynamic data}) async {
    try {
      final Response response = await _dio.post(url, data: data);
      return HttpResponseEntity<T>(
        data: response.data,
        statusCode: response.statusCode,
      );
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  // Implementação do método fetchRooms
  @override
  Future<List<dynamic>> fetchRooms() async {
    try {
      final response = await _dio.get('rooms');
      return response.data;
    } catch (e) {
      throw Exception('Erro ao buscar salas: $e');
    }
  }
}
