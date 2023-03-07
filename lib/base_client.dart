import 'dart:convert';

import 'package:http/http.dart' as http;

String baseUrl = 'http://localhost:8080/';

class BaseClient {
  var client = http.Client();

  Future<dynamic> get(String api) async {
    var url = Uri.parse(baseUrl + api);

    var response = await client.get(url);

    if (response.statusCode == 200) {
      return response.body;
    }
  }

  Future<dynamic> post(String api, var email, var pass) async {
    var url = Uri.parse(baseUrl + api);
    // var _payload = json.decode(object);

    print(url);
    var response =
        await client.post(url, body: {"email": email, "password": pass});

    if (response.statusCode == 200) {
      return response.body;
    }
  }
}
