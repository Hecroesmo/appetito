import 'package:appetito/global.dart';
import 'package:appetito/screens/menu_screen.dart';
import 'package:appetito/screens/register_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                    child: const Text('Entrar',
                        style: TextStyle(
                            color: blue,
                            fontFamily: 'Roboto-Regular',
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold))),
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
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    style: style,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const MenuScreen(),
                        ),
                      );
                    },
                    child: const Text('Entrar',
                        style: TextStyle(fontFamily: 'Roboto-Regular')),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Não tem conta ainda?'),

                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
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
