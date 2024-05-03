import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Api_Service {
  var APIKEY = dotenv.env['APIKEY'];
  String baseURL = "https://generativelanguage.googleapis.com";
  final String prompet;

  Api_Service(this.prompet);

  Future<Response?> getResponse() async {
    try {
      var url = Uri.parse(
          '$baseURL/v1/models/gemini-pro:generateContent?key=${APIKEY}');
      var body = json.encode({
        "contents": [
          {
            "role": "user",
            "parts": [
              {"text": "$prompet"}
            ]
          }
        ]
      });

      var response = await http.post(url, body: body);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      return response;
    } catch (e) {
      print(e.toString());
    }
  }
}
