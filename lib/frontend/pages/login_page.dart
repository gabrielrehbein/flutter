import 'package:flutter/material.dart';
import 'package:trabalho_final/frontend/pages/my_products_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: Column(
          children: [
            Center(child: Text("Login", style: TextStyle(fontSize: 35))),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: _email,
                    decoration: InputDecoration(labelText: "E-mail"),
                  ),
                  TextFormField(
                    controller: _password,
                    decoration: InputDecoration(labelText: "Senha"),
                    obscureText: true,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_email.text == "gaba@gaba.com" &&
                          _password.text == "123") {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyProductsPage(),
                          ),
                        );
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.login), Text("Entrar")],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
