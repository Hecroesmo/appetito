import 'package:appetito/global.dart';
import 'package:appetito/models/login_request_model.dart';
import 'package:appetito/screens/menu_screen.dart';
import 'package:appetito/screens/register_screen_person.dart';
import 'package:appetito/screens/splash_screen.dart';
import 'package:appetito/services/auth/login_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // bool validate() {
  //   var email = emailController.value.text;
  //   var password =
  //   if (!email.contains('@') || !email.contains('.com')) {
  //     return false;
  //   }
  //
  //   if ()
  // }

  authenticate(BuildContext context) async {
    LoginRequestModel model = LoginRequestModel(
        emailController.value.text.trim(),
        passwordController.value.text.trim()
    );

    bool isSaved = await LoginService().login(model);

    if (isSaved) {
      Fluttertoast.showToast(
          msg: "Login Sucesso!",);

      if (!context.mounted) return;

      Navigator.push(context, MaterialPageRoute(builder: (context) => const SplashScreen()));
    }
    else {
      Fluttertoast.showToast(
        msg: "Email ou palavra inválido.",);
    }
  }

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
                    onPressed: () async {
                      await authenticate(context);
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
                              builder: (context) => const RegisterPersonScreen(),
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
