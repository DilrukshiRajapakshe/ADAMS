import 'dart:convert';
import 'package:adams/UserInfo/UserName.dart';
import 'package:http/http.dart' as http;
import 'package:adams/fileReader/service/FileReaderServiceImpl.dart';

  Future<String> getDrug(http.Client client,data) async {

      final response = await client.post(
        await parseJson("getDrug"),headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }, body: jsonEncode(<String, String>{
        'value': data,
      }),
      );

      if (response.statusCode == 200) {
        final response_Body = await json.decode(response.body);
        print(response_Body);
        return response_Body["value"];

      } else {
        throw Exception('Failed to load data in service');
      }
  }

  Future<String> getIdentification(http.Client client,data) async {

    final response = await client.post(
      await parseJson("getIdentification"),headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    }, body: jsonEncode(<String, String>{
      'value': data,
    }),
    );

    if (response.statusCode == 200) {
      final response_Body = await json.decode(response.body);
      print(response_Body);
      return response_Body["value"];

    } else {
      throw Exception('Failed to load data in service');
    }
  }

  Future<String> getDisease(http.Client client,data) async {

    final response = await client.post(
      await parseJson("getDisease"),headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    }, body: jsonEncode(<String, String>{
      'value': data,
    }),
    );

    if (response.statusCode == 200) {
      final response_Body = await json.decode(response.body);
      print(response_Body);
      return response_Body["value"];

    } else {
      throw Exception('Failed to load data in service');
    }
  }


Future<String> getAppointmentInfo(http.Client client,data) async {

    final response = await client.post(
      await parseJson("getAppointmentInfo"),headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    }, body: jsonEncode(<String, String>{
      'value': data,
    }),
    );

    if (response.statusCode == 200) {
      final response_Body = await json.decode(response.body);
      print(response_Body);
      return response_Body["value"];

    } else {
      throw Exception('Failed to load data in service');
    }
  }

  Future<String> getRASA(http.Client client, data) async {

    String sender = await getUserName();
    String message = data;

    final response = await client.post(
      await parseJson("getRASA"),headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    }, body: jsonEncode(<String, String>{
      'sender': sender, 'message': message,
    }),
    );

    if (response.statusCode == 200) {
      final response_Body = await json.decode(response.body);
      print(response_Body);
      return response_Body[0]["text"];

    } else {
      throw Exception('Failed to load data in service');
    }
  }

  Future<String> setRASA(http.Client client, data) async {

    String sender = await getUserName();
    String message = data;
    final response = await client.post(
      await parseJson("setRASA"),headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    }, body: jsonEncode(<String, String>{
      'sender': sender, 'message': message,
    }),
    );

    if (response.statusCode == 200) {
      final response_Body = await json.decode(response.body);
      print(response_Body);
      return response_Body[0]["text"];

    } else {
      throw Exception('Failed to load data in service');
    }
  }

