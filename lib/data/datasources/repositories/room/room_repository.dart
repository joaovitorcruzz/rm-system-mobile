// import 'package:rm_systems_mobile/domain/entities/core/http_response_entity.dart';
import 'package:rm_systems_mobile/domain/entities/room/room_entity.dart';
import 'package:rm_systems_mobile/core/service/http_service.dart'; // Importando a versão correta do HttpService

abstract interface class IRoomRepository {
  Future<List<RoomEntity>> fetchRooms();
}

final class RoomRepository implements IRoomRepository {
  final IHttpService _httpService;

  const RoomRepository(this._httpService);

  @override
  Future<List<RoomEntity>> fetchRooms() async {
    try {
      final roomsData = await _httpService.fetchRooms();
      return roomsData.map((room) => RoomEntity.fromMap(room)).toList();
    } catch (e) {
      throw Exception('Erro ao buscar salas: $e');
    }
  }
}
