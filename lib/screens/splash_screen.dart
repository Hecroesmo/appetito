import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:appetito/screens/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/splash_screen.PNG"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
            child: Column(
          children: <Widget>[
            //  const SizedBox(width: 20.0, height: 100.0),
            /*const Text(
              '',
              style: TextStyle(
                  fontSize: 43.0,
                  color: Color(0xFFF2994A),
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold),
            ),*/
            const SizedBox(width: 20.0, height: 250.0),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 50.0,
                fontFamily: 'Roboto',
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  RotateAnimatedText('Reserva', textStyle: const TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
                  RotateAnimatedText('em um', textStyle: const TextStyle(fontSize: 40.0,fontWeight: FontWeight.bold)),
                  RotateAnimatedText('click', textStyle: const TextStyle(fontSize: 40.0,fontWeight: FontWeight.bold)),
                ],
                onTap: () {},
              ),
            ),
          ],
        ))
      ],
    ));
  }

  startTimer() {
    Timer(const Duration(seconds: 8), () {
      Navigator.push(context, MaterialPageRoute(builder: (c) => LoginScreen()));
    });
  }
}
