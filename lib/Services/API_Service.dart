import 'dart:convert';

import 'package:chatgpt_clone/Provider/chat_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Api_Service {
  static var APIKEY = dotenv.env['APIKEY'];
  static String baseURL = "https://generativelanguage.googleapis.com";

  static Future<Map<String , dynamic>> getResponse({@required  prompet}) async {
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
      ChatCubit.responseStatusCode = response.statusCode;
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        var ResponseBody = jsonDecode(response.body);
        return ResponseBody;
      }else {
        // If the response status is not 200, throw an error
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
      // If the response status is not 200, throw an error
      throw Exception('Failed to load data: ${e.toString()}');
    }
  }
}
