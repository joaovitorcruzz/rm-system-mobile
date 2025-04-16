import 'package:dio/dio.dart';
import 'package:rm_systems_mobile/domain/entities/room/room_entity.dart';

class RoomService {
  final Dio _dio;

  RoomService(this._dio);

  Future<List<RoomEntity>> fetchRooms() async {
    try {
      final response = await _dio.get('http://localhost:8000/api/rooms');
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((room) => RoomEntity.fromMap(room))
            .toList();
      } else {
        throw Exception('Falha ao carregar as salas');
      }
    } catch (e) {
      throw Exception('Erro: $e');
    }
  }
}
