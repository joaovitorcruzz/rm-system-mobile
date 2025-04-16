final class RoomEntity {
  final int id;
  final String name;
  final String description;
  final int capacity;

  const RoomEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.capacity,
  });

  factory RoomEntity.fromMap(Map<String, dynamic> map) {
    return RoomEntity(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      capacity: map['capacity'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'capacity': capacity,
    };
  }
}