import 'package:trabalho_final/backend/dtos/create_user_dto.dart';
import 'package:trabalho_final/backend/models/user.dart';

abstract class UserRepositoryInterface {
  List<User> all();

  User create(CreateUserDto createUserDTO);

  User? getUserByEmail(String email);
}
