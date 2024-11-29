import 'dart:io';
import 'package:http/http.dart' as http; // Perbaikan impor
import 'dart:convert';
import 'package:flutter_fundamental/pages/pizza.dart';

class HttpHelper {
  final String authority = 'or4ml.wiremockapi.cloud';
  final String path = 'pizzalist';

  // Get
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

  //POST
  Future<String> postPizza(Pizza pizza) async {
    const postPath = '/pizza';
    String post = json.encode(pizza.toJson());
    Uri url = Uri.http(authority, postPath);
    http.Response r = await http.post(
      url,
      body: post,
    );
    return r.body;
  }

  //PUT
  Future<String> putPizza(Pizza pizza) async {
    const putPath = '/pizza';
    String put = json.encode(pizza.toJson());
    Uri url = Uri.http(authority, putPath);
    http.Response r = await http.put(
      url,
      body: put,
    );
    return r.body;
  }

  //DELETE
  Future<String> deletePizza(int pizzaId) async {
    String deletePath = '/pizza/$pizzaId';
    Uri url = Uri.http(authority, deletePath);
    http.Response r = await http.delete(
      url,
    );

    if (r.statusCode == HttpStatus.ok) {
      print('Pizza dengan ID $pizzaId berhasil dihapus.');
    } else {
      print(
          'Gagal menghapus pizza dengan ID $pizzaId. Status: ${r.statusCode}');
    }

    return r.body;
  }
}
