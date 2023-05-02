import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
      emailController = TextEditingController();
      passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
        minimumSize: const Size(double.infinity, 45.0),
        backgroundColor: const Color(0xFFF2994A));

    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(title: const Text('Login')),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 99.0, 0, 40.0),
                    child: const Text('Crie a sua Conta',
                        style: TextStyle(
                            color: Color(0xFF003366),
                            fontFamily: 'Roboto-Regular',
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold))),
                Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  padding: const EdgeInsets.all(20.0),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'E-mail',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  padding: const EdgeInsets.all(20.0),
                  child: const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Palavra-Passe',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    style: style,
                    onPressed: () {},
                    child: const Text('Entrar',
                        style: TextStyle(fontFamily: 'Roboto-Regular')),
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text('Não te conta ainda? clique aqui'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
