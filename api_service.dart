// api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://127.0.0.1:8000/api';

  static Future<List<dynamic>> getHotels() async {
    final response = await http.get(Uri.parse('$baseUrl/hotelDetails/'));
    return jsonDecode(response.body);
  }

  static Future<void> createHotel(String name, String address, double price) async {
    await http.post(
      Uri.parse('$baseUrl/hotelDetails/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'address': address,
        'price': price,
      }),
    );
  }

  static Future<void> updateHotel(int id, String name, String address, double price) async {
    await http.put(
      Uri.parse('$baseUrl/hotelDetails/$id/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'address': address,
        'price': price,
      }),
    );
  }

  static Future<void> deleteHotel(int id) async {
    await http.delete(Uri.parse('$baseUrl/hotelDetails/$id/'));
  }
}