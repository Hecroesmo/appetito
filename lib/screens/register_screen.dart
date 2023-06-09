import 'package:appetito/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:appetito/global.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(title: const Text('Login')),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 50.0, 0, 40.0),
                    child: const Text('Crie a sua Conta',
                        style: TextStyle(
                            color: blue,
                            fontFamily: 'Roboto-Regular',
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold))),
                Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nome',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'E-mail',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Palavra-Passe',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: rePasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirmar Palavra-Passe',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    style: style,
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (c) => LoginScreen()),
                      );
                    },
                    child: const Text('Registar',
                        style: TextStyle(fontFamily: 'Roboto-Regular')),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Já tem conta?'),

                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        child: const Text('clique aqui')),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
