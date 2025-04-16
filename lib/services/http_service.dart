import 'dart:io';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpService {
  final Dio _dio;

  HttpService() : _dio = Dio(BaseOptions(baseUrl: _getBaseUrl()));

  // Função para obter a URL base corretamente dependendo do ambiente
  static String _getBaseUrl() {
    if (isAndroidEmulator()) {
      return 'http://10.0.2.2:8000/api/';  // Para Android emulador
    } else if (isIOS()) {
      return 'http://127.0.0.1:8000/api/';  // Para iOS emulador
    } else {
      return 'http://localhost:8000/api/';  // Para desenvolvimento local
    }
  }

  // Função para detectar se está em emulador Android
  static bool isAndroidEmulator() {
    return Platform.isAndroid;
  }

  // Função para detectar se está em iOS
  static bool isIOS() {
    return Platform.isIOS;
  }

  Future<Map<String, dynamic>> postLogin(String email, String password) async {
    try {
      final response = await _dio.post('login', data: {
        'email': email,
        'password': password,
      });

      final token = response.data['token'];
      await _saveToken(token);
      return response.data;
    } catch (e) {
      throw Exception('Erro ao autenticar: $e');
    }
  }

  // Salva o token no SharedPreferences
  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  // Obtém o perfil do usuário
  Future<void> getUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');

    if (token != null) {
      _dio.options.headers['Authorization'] = 'Bearer $token';
    }

    final response = await _dio.get('profile');
    return response.data;
  }

  // Busca as salas
  Future<List<dynamic>> fetchRooms() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');

    if (token != null) {
      _dio.options.headers['Authorization'] = 'Bearer $token';
    }

    try {
      final response = await _dio.get('rooms');
      return response.data;
    } catch (e) {
      throw Exception('Erro ao buscar salas: $e');
    }
  }
}
