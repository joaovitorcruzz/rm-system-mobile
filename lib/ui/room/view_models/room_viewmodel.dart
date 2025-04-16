import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rm_systems_mobile/data/datasources/repositories/room/room_repository.dart';
import 'package:rm_systems_mobile/domain/entities/core/request_state_entity.dart';
import 'package:rm_systems_mobile/domain/entities/room/room_entity.dart';

class RoomViewModel extends Cubit<IRequestState<List<RoomEntity>>> {
  final IRoomRepository _repository;
  List<RoomEntity> _allRooms = [];

  RoomViewModel(this._repository) : super(const RequestInitiationState()) {
    fetchRooms();
  }

  Future<void> fetchRooms() async {
    try {
      _emit(RequestProcessingState());
      final rooms = await _repository.fetchRooms();
      _allRooms = rooms;
      _emit(RequestCompletedState(value: rooms));
    } catch (error) {
      _emit(RequestErrorState(error: error));
    }
  }

  void setSearchQuery(String query) {
    final filteredRooms = _allRooms.where((room) {
      return room.name.toLowerCase().contains(query.toLowerCase());
    }).toList();
    _emit(RequestCompletedState(value: filteredRooms));
  }

  void _emit(IRequestState<List<RoomEntity>> state) {
    if (isClosed) return;
    emit(state);
  }
}
