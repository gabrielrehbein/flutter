import 'package:flutter/material.dart';
import 'package:trabalho_final/backend/actions/create_user_action.dart';
import 'package:trabalho_final/backend/repositories/user_in_memory_repository.dart';
import 'package:trabalho_final/frontend/layout/header.dart';

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({super.key});

  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool _isAdmin = false;

  final createUserAction = CreateUserAction(
    userRepository: UserInMemoryRepository(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(title: "Cadastrar usuário"),
      body: Card(
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: _email,
                decoration: const InputDecoration(labelText: "E-mail"),
              ),

              TextFormField(
                controller: _password,
                decoration: const InputDecoration(labelText: "Senha"),
              ),
              CheckboxListTile(
                value: _isAdmin,
                onChanged: (value) {
                  setState(() {
                    _isAdmin = value ?? false;
                  });
                },
                title: Text("É Admistrador?"),
              ),

              ElevatedButton(
                onPressed: () {
                  createUserAction.execute(
                    _email.text,
                    _password.text,
                    _isAdmin,
                  );
                  Navigator.pop(context);
                },
                child: Text("Cadastrar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
