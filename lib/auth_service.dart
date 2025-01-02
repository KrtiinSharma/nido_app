import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = 'https://apitest.gonido.co/main/api/auth/token/';

  Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print('Error response: ${response.body}');
      throw Exception('Failed to log in: ${response.body}');
    }
  }

  Future<String?> signup(
      String mobile, String name, String email, String password) async {
    // Implement signup logic if needed
    throw UnimplementedError("Signup not implemented");
  }
}
