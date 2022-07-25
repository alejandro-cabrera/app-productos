import 'dart:async';
import 'dart:convert';
import 'dart:io';
import "package:http/http.dart" as http;

Future<List<Productos>> fetchAlbum() async {
  String credentials = "aicabrera@utpl.edu.ec:958613197ff9647e7b4e";
  Codec<String, String> stringToBase64 = utf8.fuse(base64);
  String credentialsBase64 = stringToBase64.encode(credentials);

  final response = await http.get(
    Uri.parse('https://api.alegra.com/api/v1/items/'),
    // Send authorization headers to the backend.
    headers: {
      HttpHeaders.authorizationHeader: "Basic $credentialsBase64",
    },
  );
  final responseJson = jsonDecode(response.body);
  print('Response body: ${response.body}');
  return responseJson.map<Productos>(Productos.fromJson).toList();
}

class Productos {
  final String itemName;
  final String price;

  const Productos({required this.itemName, required this.price});

  static Productos fromJson(json) =>
      Productos(itemName: json['name'], price: json['price'][0]['price']);
}

Future<http.Response> enviarDatos(String data) async {
  String credentials = "aicabrera@utpl.edu.ec:958613197ff9647e7b4e";
  Codec<String, String> stringToBase64 = utf8.fuse(base64);
  String credentialsBase64 = stringToBase64.encode(credentials);

  final response = await http.post(
    Uri.parse('https://api.alegra.com/api/v1/items/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: "Basic $credentialsBase64"
    },
    body: data,
  );

  final responseJson = jsonDecode(response.body);
  print('Response body: ${response.body}');
  return responseJson.map<Productos>(Productos.fromJson).toList();
}
