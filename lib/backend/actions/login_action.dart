import 'package:trabalho_final/backend/interfaces/user_repository_interface.dart';
import 'package:trabalho_final/backend/models/user.dart';
import 'package:trabalho_final/backend/services/auth_service.dart';

class LoginAction {
  final UserRepositoryInterface userRepository;
  final AuthService authService = AuthService();

  LoginAction({required this.userRepository});

  bool execute(String email, String password) {
    User? user = userRepository.getUserByEmail(email);
    if (user != null && authService.comparePassword(password, user.password)) {
      return true;
    }
    return false;
  }
}
