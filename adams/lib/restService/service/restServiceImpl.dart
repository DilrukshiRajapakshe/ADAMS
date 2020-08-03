import 'dart:convert';
import 'package:adams/restService/entity/Localhost.dart';
import 'package:http/http.dart' as http;

  Future getDiseaseInfo(http.Client client,data) async {

      final response = await client.post(
        URL_SESSION_ID,headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }, body: jsonEncode(<String, String>{
        'Value': data,
      }),
      );

      if (response.statusCode == 200) {
        final response_Body = await json.decode(response.body);
        print(response_Body);

      } else {
        throw Exception('Failed to load data in service');
      }

  }
