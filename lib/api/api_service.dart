import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiUrl = 'https://neonlogicsihbackend-production.up.railway.app/test';

  Future<List<Map<String, dynamic>>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      
      return data.map((item) => item as Map<String, dynamic>).toList();
    } else {
      throw Exception('Failed to load products');
    }
    
  }
}
