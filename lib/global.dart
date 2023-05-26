import 'package:flutter/material.dart';

const Color blue =  Color(0xFF003366);
const Color orange =  Color(0xFFF2994A);
const Color pink = Color(0xFFFFE8D3);
const Color gray = Color(0xFF828282);

const TextStyle titleStyle = TextStyle(
        fontSize: 27.0,
        color: orange,
        fontWeight: FontWeight.bold,
        fontFamily: 'Roboto');

final ButtonStyle style = ElevatedButton.styleFrom(
    textStyle: const TextStyle(fontSize: 20),
    minimumSize: const Size(double.infinity, 45.0),
    backgroundColor: orange,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
    )
);

//  style of week
final ButtonStyle weekdaysButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: orange,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),
  ),
);

final ButtonStyle playIconButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    padding: EdgeInsets.zero
);

