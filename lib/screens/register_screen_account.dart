import 'package:appetito/models/Person.dart';
import 'package:appetito/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:appetito/global.dart';

class RegisterAccountScreen extends StatelessWidget {
  final Person person;
  RegisterAccountScreen(this.person, {Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  validateAccountData() {}

  setAccountData() {
    person.email = emailController.value.text;
    person.password = passwordController.value.text;
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: const Text(
              'Dados da Conta',
              style: TextStyle(
                  color: blue,
                  fontFamily: 'Roboto-Regular',
                  fontSize: 27.0,
                  fontWeight: FontWeight.bold)),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: blue,
              size: 40,
            ),
            onPressed: () {
              Navigator.pop(context);
            },),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                // Container(
                //     margin: const EdgeInsets.fromLTRB(0, 50.0, 0, 40.0),
                //     child: const Text('Crie a sua Conta',
                //         style: TextStyle(
                //             color: blue,
                //             fontFamily: 'Roboto-Regular',
                //             fontSize: 32.0,
                //             fontWeight: FontWeight.bold))),
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
