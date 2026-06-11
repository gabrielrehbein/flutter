import 'package:uuid/uuid.dart';

class User {
  String id;
  String email;
  String password;
  bool isAdmin;

  User({required this.email, required this.password, required this.isAdmin})
    : id = const Uuid().v4();
}
