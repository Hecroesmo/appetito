import 'package:appetito/models/Person.dart';
import 'package:appetito/screens/login_screen.dart';
import 'package:appetito/screens/register_screen_account.dart';
import 'package:flutter/material.dart';

import '../global.dart';

class RegisterPersonScreen extends StatefulWidget {
  const RegisterPersonScreen({Key? key}) : super(key: key);

  @override
  State<RegisterPersonScreen> createState() => _RegisterPersonScreenState();
}

class _RegisterPersonScreenState extends State<RegisterPersonScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  late Person person = Person();

  setPersonData() {
    person.firstName = firstNameController.value.text.trim();
    person.lastName = lastNameController.value.text.trim();
    person.phoneNumber = phoneNumberController.value.text.trim();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: const Text(
              'Dados Pessoais',
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
                //     child: const Padding(
                //       padding: EdgeInsets.symmetric(horizontal: 10),
                //       child: Text('UM POUCO SOBRE VOCÊ!',
                //           style: TextStyle(
                //               color: blue,
                //               fontFamily: 'Roboto-Regular',
                //               fontSize: 27.0,
                //               fontWeight: FontWeight.bold)),
                //     )),
                Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: firstNameController,
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
                    controller: lastNameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Sobrenome',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: phoneNumberController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Tel',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    style: style,
                    onPressed: () {
                      setPersonData();
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (c) => RegisterAccountScreen(person)),
                      );
                    },
                    child: const Text('Proximo',
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
