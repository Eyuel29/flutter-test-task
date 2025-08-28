import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/todo.dart';

class ApiService {
  final http.Client _client = http.Client();
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<Todo>> fetchTodos() async {
    try {
      final response = await _client.get(Uri.parse('$baseUrl/todos'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((jsonItem) => Todo.fromJson(jsonItem)).toList();
      } else {
        throw Exception('Failed to load todos: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching todos: $e');
    }
  }
}
