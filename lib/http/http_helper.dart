import 'dart:io';
import 'package:http/http.dart' as http; // Perbaikan impor
import 'dart:convert';
import 'package:flutter_fundamental/pages/pizza.dart';

class HttpHelper {
  final String authority = 'or4ml.wiremockapi.cloud';
  final String path = 'pizzalist';

  Future<List<Pizza>> getPizzaList() async {
    final Uri url = Uri.http(authority, path);
    final http.Response result = await http.get(url);

    print('Response status: ${result.statusCode}');
    print('Response body: ${result.body}');

    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      if (jsonResponse is List) {
        List<Pizza> pizza =
            jsonResponse.map<Pizza>((i) => Pizza.fromJson(i)).toList();
        return pizza;
      } else {
        print('Invalid JSON format');
        return [];
      }
    } else {
      print('HTTP error: ${result.statusCode}');
      return [];
    }
  }
}
