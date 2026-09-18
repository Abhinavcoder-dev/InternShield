import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Member 2 will provide the real URL later
  static const String apiUrl =
      'https://symmetrical-yodel-r7pv49px7wvgfpp6j-8000.app.github.dev/analyze';

  static Future<Map<String, dynamic>> analyzeJob(String description) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'description': description}),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}
