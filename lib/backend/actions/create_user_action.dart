import 'package:trabalho_final/backend/dtos/create_user_dto.dart';
import 'package:trabalho_final/backend/interfaces/user_repository_interface.dart';
import 'package:trabalho_final/backend/models/user.dart';
import 'package:trabalho_final/backend/services/auth_service.dart';

class CreateUserAction {
  final UserRepositoryInterface userRepository;

  CreateUserAction({required this.userRepository});

  User execute(String email, String password, bool isAdmin) {
    String hashedPassword = AuthService.hashPassword(password);

    if (userRepository.getUserByEmail(email) != null) {
      throw Exception("This email already in use");
    }

    User user = userRepository.create(
      CreateUserDto(email: email, password: hashedPassword, isAdmin: isAdmin),
    );
    return user;
  }
}
