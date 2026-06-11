import 'package:flutter/material.dart';
import 'package:trabalho_final/backend/interfaces/user_repository_interface.dart';
import 'package:trabalho_final/backend/models/user.dart';
import 'package:trabalho_final/frontend/layout/header.dart';

class ListUserPage extends StatelessWidget {
  final UserRepositoryInterface userRepository;

  const ListUserPage({super.key, required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(title: "Usuários"),
      body: ListView(
        children: [
          ...userRepository.all().map((User user) {
            return Card(
              child: Row(
                children: [
                  Text("E-mail: ${user.email}"),
                  Text(
                    "Tipo usuário: ${user.isAdmin ? 'Administrador' : 'Normal'}",
                    style: TextStyle(
                      backgroundColor: user.isAdmin ? Colors.blue : Colors.red,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
