import 'dart:convert';
import 'package:adams/Service/UserInfo/UserInformation.dart';
import 'package:adams/Service/fileReader/service/FileReaderImpl.dart';
import 'package:http/http.dart' as http;

import '../restService.dart';

// Rest api connection -- start
class RestServiceImpl implements RestService {
  UserInformation info = new UserInformation();

// RASA webhook api
//  @override
//  Future<String> getRASA(http.Client client, data) async {
//    String sender = await info.getUserName();
//    String message = data;
//
//    try {
//      final response = await client.post(
//        await parseJson("rasa"),
//        headers: <String, String>{
//          'Content-Type': 'application/json; charset=UTF-8',
//        },
//        body: jsonEncode(<String, String>{
//          'sender': sender,
//          'message': message,
//        }),
//      );
//
//      if (response.statusCode == 200) {
//        final response_Body = await json.decode(response.body);
//        print(response_Body);
//        return response_Body[0]["text"];
//      } else {
//        throw Exception('Failed to load data in service');
//      }
//    } catch (e) {
//      print(e);
//    }
//  }

  Future<String> getRASA(http.Client client, data) async {
    String sender = await info.getUserName();
    String message = data;
    try {
      final response = await client.post(
        "http://192.168.8.102:5005/webhooks/rest/webhook",
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'sender': sender,
          'message': message,
        }),
      );

      if (response.statusCode == 200) {
        final response_Body = await json.decode(response.body);
        print(response_Body);
        return response_Body[0]["text"];
      } else {
        throw Exception('Failed to load data in service');
      }
    } catch (e) {
      print(e);
    }
  }


//  ontology
  @override
  Future<String> getOnto(http.Client client, data) async {
    String message = data;
    try {
      final response = await client.post(
        await parseJson("onto"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'message': message,
        }),
      );

      if (response.statusCode == 200) {
        final response_Body = await json.decode(response.body);
        print(response_Body);
        return response_Body[0]["massage"];
      } else {
        throw Exception('Failed to load data in service');
      }
    } catch (e) {
      print(e);
    }
  }

// RASA plugin
  @override
  Future<String> getRASA_Plugin(http.Client client, data) async {
    var message = data;
    try {
      final response = await client.post(
        await parseJson("rasaPlugin"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'message': message,
        }),
      );

      if (response.statusCode == 200) {
        final response_Body = await json.decode(response.body);
        print(response_Body);
        return response_Body[0]["massage"];
      } else {
        throw Exception('Failed to load data in service');
      }
    } catch (e) {
      print(e);
    }
  }

//  Appointment
  @override
  Future<String> getAppointmentInfo(http.Client client, data) async {
    String message = data;
    try {
      final response = await client.post(
        await parseJson("appointment"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'message': message,
        }),
      );

      if (response.statusCode == 200) {
        final response_Body = await json.decode(response.body);
        print(response_Body);
        return response_Body[0]["massage"];
      } else {
        throw Exception('Failed to load data in service');
      }
    } catch (e) {
      print(e);
    }
  }

// Rest api connection -- end
}
