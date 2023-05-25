import 'package:flutter/material.dart';

const Color blue =  Color(0xFF003366);
const Color orange =  Color(0xFFF2994A);
const Color pink = Color(0xFFFFE8D3);

final ButtonStyle style = ElevatedButton.styleFrom(
    textStyle: const TextStyle(fontSize: 20),
    minimumSize: const Size(double.infinity, 45.0),
    backgroundColor: orange,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
    )
);

final weekdaysButtonStyle = ElevatedButton.styleFrom(
    textStyle: const TextStyle(fontSize: 20),
    minimumSize: const Size(double.infinity, 45.0),
    backgroundColor: orange,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0)
  )
);

