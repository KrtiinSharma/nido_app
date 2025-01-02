import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl =
      'http://localhost:5000/api'; // Change to your server URL

  Future<String?> signup(
      String mobile, String name, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/signup'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'mobile': mobile,
        'name': name,
        'email': email,
        'password': password
      }),
    );

    if (response.statusCode == 201) {
      return json.decode(response.body)['token'];
    } else {
      throw Exception('Failed to sign up: ${response.body}');
    }
  }

  Future<String?> login(String mobile, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'mobile': mobile, 'password': password}),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body)['token'];
    } else {
      throw Exception('Failed to log in: ${response.body}');
    }
  }
}
