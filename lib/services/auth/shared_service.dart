import 'package:appetito/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:appetito/models/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedService {
  static Future<bool> isLogged() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final token = prefs.getString('token');

    if (token == null) {
      return false;
    } else {
      return true;
    }
  }

  static Future<void> setToken(LoginResponseModel loginResponseModel) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('token', loginResponseModel.token);
  }

  static Future<void> logout(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove('token');
    
    if (!context.mounted) return;

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);

  }
}