import 'dart:convert';
import 'package:assignment_3/photo.dart';
import 'package:http/http.dart' as http;

class PhotoService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com/photos';

  Future<List<Photo>> getPhotos() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Photo.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load photos: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }
}
