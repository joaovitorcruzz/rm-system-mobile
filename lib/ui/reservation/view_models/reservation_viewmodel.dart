import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rm_systems_mobile/data/datasources/core/data_source.dart';
import 'package:rm_systems_mobile/domain/entities/core/request_state_entity.dart';
import 'package:rm_systems_mobile/domain/entities/room/reservation_entity.dart';

final class ReservationViewModel extends Cubit<IRequestState<List<ReservationEntity>>> {
  final IRemoteDataSource _remoteDataSource;
  List<ReservationEntity> _reservations = [];
  ReservationEntity? _currentReservation;

  ReservationViewModel(this._remoteDataSource) : super(const RequestInitiationState());

  Future<void> fetchReservations(String userEmail) async {
    try {
      _emit(RequestProcessingState());
      final now = DateTime.now();
      final reservations = [
        ReservationEntity(
          id: 1,
          roomId: 1,
          roomName: "Sala A",
          startTime: now.subtract(const Duration(hours: 1)),
          endTime: now.add(const Duration(hours: 1)),
          userEmail: userEmail,
          isCurrent: true,
        ),
      ];
      _reservations = reservations;
      _currentReservation = reservations.firstWhere((r) => r.isCurrent, orElse: () => reservations.first);
      _emit(RequestCompletedState(value: reservations));
    } catch (error) {
      _emit(RequestErrorState(error: error));
    }
  }

  Future<void> addReservation(int roomId, String roomName, DateTime startTime, String userEmail) async {
    try {
      _emit(RequestProcessingState());
      final reservation = ReservationEntity(
        id: _reservations.length + 1,
        roomId: roomId,
        roomName: roomName,
        startTime: startTime,
        endTime: startTime.add(const Duration(hours: 1)),
        userEmail: userEmail,
        isCurrent: true,
      );
      _reservations.add(reservation);
      _currentReservation = reservation;
      _emit(RequestCompletedState(value: _reservations));
    } catch (error) {
      _emit(RequestErrorState(error: error));
    }
  }

  Future<void> requestSwap(String userEmail, int currentRoomId, int targetRoomId) async {
    try {
      _emit(RequestProcessingState());
      _emit(RequestCompletedState(value: _reservations));
    } catch (error) {
      _emit(RequestErrorState(error: error));
    }
  }

  void _emit(IRequestState<List<ReservationEntity>> state) {
    if (isClosed) return;
    emit(state);
  }
}