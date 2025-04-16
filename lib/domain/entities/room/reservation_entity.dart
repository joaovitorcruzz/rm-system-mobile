class ReservationEntity {
  final int id;
  final int roomId;
  final String roomName;
  final DateTime startTime;
  final DateTime endTime;
  final String userEmail;
  final bool isCurrent;
  final int? requestedRoomId;

  ReservationEntity({
    required this.id,
    required this.roomId,
    required this.roomName,
    required this.startTime,
    required this.endTime,
    required this.userEmail,
    this.isCurrent = false,
    this.requestedRoomId,
  });
}