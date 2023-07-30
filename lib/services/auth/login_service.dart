import 'dart:convert';

import 'package:appetito/models/login_request_model.dart';
import 'package:appetito/models/login_response_model.dart';
import 'package:appetito/services/auth/shared_service.dart';
import 'package:http/http.dart' as http;
import 'package:appetito/config/endpoints.dart';

class LoginService {
  static var client = http.Client();

  static Future<bool> login(LoginRequestModel loginModel) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'aplication/json',
    };

    var url = Uri.http(Endpoints.baseUrl, Endpoints.loginUrl);

    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(loginModel.toJson()));

    if (response.statusCode == 200) {
      //  Shared
      LoginResponseModel loginRes = LoginResponseModel(response.body);
      SharedService.setToken(loginRes);
      return true;
    } else {
      return false;
    }
  }
}
