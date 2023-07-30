import 'dart:convert';

import 'package:appetito/models/login_request_model.dart';
import 'package:appetito/models/login_response_model.dart';
import 'package:appetito/services/auth/shared_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:appetito/config/endpoints.dart';

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

    if (kDebugMode) {
      print('login --------- ${response.statusCode}');
    }

    if (response.statusCode == 200) {
      LoginResponseModel model = LoginResponseModel(response.body);
      SharedService.setToken(model);
      return true;
    } else {
      return false;
    }
  }
}
