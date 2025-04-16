final class UserEntity {
  static const String kKeyId = 'id';
  
  final String id;
  final String name;
  final String email;
  final String profileImage;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.profileImage,
  });

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id'] ?? '',
      name: map['nome'] ?? '',
      email: map['email'] ?? '',
      profileImage: map['fotoPerfil'] ?? '',
    );
  }

  factory UserEntity.fromRemoteMap(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id'] ?? '',
      name: map['nome'] ?? '',
      email: map['email'] ?? '',
      profileImage: map['fotoPerfil'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': name,
      'email': email,
      'fotoPerfil': profileImage,
    };
  }
}
