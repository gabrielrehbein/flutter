import 'dart:convert';
import 'package:crypto/crypto.dart';

class AuthService {
  static String hashPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  bool comparePassword(String password, String hashedPassword) {
    return AuthService.hashPassword(password) == hashedPassword;
  }
}
