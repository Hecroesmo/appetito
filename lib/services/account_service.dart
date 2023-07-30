import 'dart:convert';
import 'dart:io';

import 'package:appetito/models/Account.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
class AccountService {
  final String baseUrl = 'http://10.0.2.2:8080';

  Future<Account> findByEmail(String email, String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/accounts/$email'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: token,
      },
    );

    if (kDebugMode) {
      print('AccountService->findByEmail --------- ${response.statusCode}');
    }

    if (response.statusCode == 200) {
      return Account.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to');
    }
  }
}