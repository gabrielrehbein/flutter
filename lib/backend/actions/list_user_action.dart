import 'package:trabalho_final/backend/interfaces/user_repository_interface.dart';
import 'package:trabalho_final/backend/models/user.dart';

class ListUserAction {
  final UserRepositoryInterface userRepository;

  ListUserAction({required this.userRepository});

  List<User> execute() {
    return userRepository.all();
  }
}
