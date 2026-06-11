import 'package:uuid/uuid.dart';

class User {
  String id;
  String email;
  String password;

  User({required this.email, required this.password}) : id = const Uuid().v4();
}
