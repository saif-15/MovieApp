import 'dart:convert';

import 'package:http/http.dart';
import 'api_constants.dart';

class ApiClient {
  final Client _client;

  ApiClient(this._client);

  dynamic get(String path) async {
    final response = await _client.get(
        '${APIConstants.BASE_URL}$path?api_key=${APIConstants.API_KEY}',
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      return responseBody;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
