import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:appetito/global.dart';
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
    return  Material(
      child: Container(
        color: orange,
        child: Center(
            child: SizedBox(
              child: TextLiquidFill(
                text: 'Appetito!',
                waveColor: Colors.white,
                boxBackgroundColor: orange,
                textStyle: const TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
                boxHeight: 300.0,
              ),
            )
        ),
      ),
    );
  }

  startTimer() {
    Timer(const Duration(seconds: 8), () {
      Navigator.push(context, MaterialPageRoute(builder: (c) => LoginScreen()));
    });
  }
}
