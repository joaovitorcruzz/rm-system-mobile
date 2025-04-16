import 'package:dio/dio.dart';
import 'package:rm_systems_mobile/core/service/http_service.dart';

class HttpServiceFactory {
  IHttpService create() {
    final dio = Dio(BaseOptions(
      baseUrl: 'http://localhost:8000/api/',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {
        'Content-Type': 'application/json',
      },
    ));
    return HttpService(dio);
  }
}
