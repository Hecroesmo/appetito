import 'package:appetito/models/Person.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:appetito/config/endpoints.dart';

class RegisterService {

  RegisterService();

  Future<Person> register(Person person) async {
    final response = await http.post(
      Uri.parse('${Endpoints.baseUrl}/auth/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(person),
    );

    if (response.statusCode == 201) {
      return Person.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create person.');
    }
  }

}