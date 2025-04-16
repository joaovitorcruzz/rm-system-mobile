final class LoginEntity {
  final String email;
  final String password;

  const LoginEntity({required this.email, required this.password, required String login});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }
}