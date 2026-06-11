import 'package:trabalho_final/backend/models/user.dart';
import 'package:trabalho_final/backend/services/auth_service.dart';

class UserDataInMemory {
  static final List<User> users = [
    User(email: "a", password: AuthService.hashPassword("a")),
  ];
}
