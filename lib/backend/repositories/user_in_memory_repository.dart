import 'package:trabalho_final/backend/dtos/create_user_dto.dart';
import 'package:trabalho_final/backend/interfaces/user_repository_interface.dart';
import 'package:trabalho_final/backend/database/user_data_in_memory.dart';
import 'package:trabalho_final/backend/models/user.dart';

class UserInMemoryRepository implements UserRepositoryInterface {
  @override
  List<User> all() {
    return UserDataInMemory.users;
  }

  @override
  User create(CreateUserDto createUserDTO) {
    User user = User(
      email: createUserDTO.email,
      password: createUserDTO.password,
      isAdmin: createUserDTO.isAdmin,
    );
    UserDataInMemory.users.add(user);
    return user;
  }

  @override
  User? getUserByEmail(String email) {
    try {
      return UserDataInMemory.users.firstWhere((user) => user.email == email);
    } catch (_) {
      return null;
    }
  }
}
