import 'dart:convert';
import 'package:http/http.dart' as http;

import 'model/Circle.dart';

class ApiService {
  static const String baseUrl = 'http://43.200.140.186:8080';

  Future<List<Circle>> fetchCircles(String uuid) async {
    final response = await http.get(Uri.parse('$baseUrl/mypages/$uuid/aplict-clubs'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data.map((json) => Circle.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load circles');
    }
  }
}
