class CreateUserDto {
  final String email;
  final String password;
  final bool isAdmin;

  CreateUserDto({
    required this.email,
    required this.password,
    required this.isAdmin,
  });
}
