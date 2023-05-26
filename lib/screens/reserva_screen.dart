import 'package:appetito/global.dart';
import 'package:flutter/material.dart';

class ReserveScreen extends StatelessWidget {
  const ReserveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
        'Appetito',
        style: titleStyle,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 32, color: blue,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
