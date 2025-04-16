import 'package:dio/dio.dart';

class LoginService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'http://192.168.1.5:8000', // Substitua pelo seu IP do Laravel
    contentType: 'application/json',
  ));

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await _dio.post('/api/login', data: {
        'email': email,
        'password': password,
      });

      // Se a requisição for bem-sucedida, retorna o token e o usuário
      return response.data;
    } catch (e) {
      throw Exception('Erro ao fazer login: ${e.toString()}');
    }
  }
}
