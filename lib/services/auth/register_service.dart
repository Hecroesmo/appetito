import 'package:appetito/models/Person.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterService {

  final String baseUrl = 'http://10.0.2.2:8080';

  RegisterService();

  Future<Person> register(Person person) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(person),
    );

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return Person.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create person.');
    }
  }

}