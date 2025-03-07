class RegisterResponseEntity {
  final String id;
  final String username;
  final String email;
  final String phone;
  final String token;

  RegisterResponseEntity({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.token,
  });
}
