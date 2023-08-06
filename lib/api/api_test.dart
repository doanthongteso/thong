import 'dart:convert';
import 'package:http/http.dart' as http;

void testLoginAPI() async {
  final url =
      'https://thong.com/login'; // Replace with your actual API endpoint

  final body =
      json.encode({'email': 'user@example.com', 'password': 'password'});

  final response = await http.post(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json'},
    body: body,
  );

  if (response.statusCode == 200) {
    final responseData = json.decode(response.body);
    print('Login Successful');
    print('Response Data: $responseData');
  } else {
    final errorData = json.decode(response.body);
    print('Login Failed');
    print('Error Message: ${errorData['message']}');
  }
}
