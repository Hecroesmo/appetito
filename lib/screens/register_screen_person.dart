import 'package:appetito/models/Person.dart';
import 'package:appetito/screens/login_screen.dart';
import 'package:appetito/screens/register_screen_account.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  bool validatePerson() {
    String firstName = firstNameController.value.text;
    String lastName = lastNameController.value.text;
    String phoneNumber = phoneNumberController.value.text;

    if (
    firstName.isEmpty ||
        lastName.isEmpty ||
        phoneNumber.isEmpty ||
        !phoneNumber.startsWith('9') ||
        phoneNumber.length != 9
    ) {
      return false;
    }

    return true;
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
                      bool isValidPerson = validatePerson();

                      if (isValidPerson) {
                        setPersonData();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (c) => RegisterAccountScreen(person)),
                        );
                      }
                      else {
                        Fluttertoast.showToast(msg: 'Dados inválido!');
                      }
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
