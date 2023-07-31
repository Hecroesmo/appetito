import 'dart:convert';

import 'package:appetito/models/Account.dart';
import 'package:appetito/models/login_request_model.dart';
import 'package:appetito/models/login_response_model.dart';
import 'package:appetito/services/account_service.dart';
import 'package:appetito/services/auth/shared_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {

  final String baseUrl = 'http://10.0.2.2:8080';

  Future<bool> login(LoginRequestModel model) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/authenticate'),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(model),
    );

    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      LoginResponseModel loginRes = LoginResponseModel.fromJson(jsonDecode(response.body));
      prefs.setString('token', 'Bearer ${loginRes.token}');

      Account account = await AccountService().findByEmail(model.email, prefs.getString('token')!);
      prefs.setString('role', account.role);
      prefs.setString('email', account.email);
      prefs.setInt('id', account.id);
      return true;
    } else {
      return false;
    }
  }
}
