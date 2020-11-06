import 'dart:convert';
import 'package:adams/Service/UserInfo/UserInformation.dart';
import 'package:adams/Service/fileReader/service/FileReaderImpl.dart';
import 'package:http/http.dart' as http;

import '../restService.dart';

// Rest api connection -- start
class RestServiceImpl implements RestService {
  UserInformation info = new UserInformation();
// drug Info

  Future<String> getDrug(http.Client client, data) async {
    final response = await client.post(
      await parseJson("getDrug"), headers: <String, String>{
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


//  Future<String> getIdentification(http.Client client,data) async {
//
//    final response = await client.post(
//      await parseJson("getIdentification"),headers: <String, String>{
//      'Content-Type': 'application/json; charset=UTF-8',
//    }, body: jsonEncode(<String, String>{
//      'value': data,
//    }),
//    );
//
//    if (response.statusCode == 200) {
//      final response_Body = await json.decode(response.body);
//      print(response_Body);
//      return response_Body["value"];
//
//    } else {
//      throw Exception('Failed to load data in service');
//    }
//  }

// Disease Info
  Future<String> getDisease(http.Client client, data) async {
    final response = await client.post(
      await parseJson("getDisease"), headers: <String, String>{
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

// Appointment Info
  Future<String> getAppointmentInfo(http.Client client, data) async {
    final response = await client.post(
      await parseJson("getAppointmentInfo"), headers: <String, String>{
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

// RASA webhook api connection
  Future<String> getRASA(http.Client client, data) async {
    String sender = await info.getUserName();
    String message = data;

    try {
      final response = await client.post(
        await parseJson("getRASA"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }, body: jsonEncode(<String, String>{
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

// RASA and Mciroservice connection(RASA plugin) service  api connection
  Future<String> setRASA(http.Client client, data) async {
    String sender = await info.getUserName();
    String message = data;
    final response = await client.post(
      await parseJson("setRASA"), headers: <String, String>{
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

//Future<String> test(http.Client client) async {
//  String data = "test";
//  final response = await client.post(
//    'http://192.168.8.100:8000/',headers: <String, String>{
//    'Content-Type': 'application/json; charset=UTF-8',
//  }, body: jsonEncode(<String, String>{
//    'Value': data,
//  }),
//  );
//
//  if (response.statusCode == 200) {
//    final response_Body = await json.decode(response.body);
//    print(response_Body);
//
//  } else {
//    throw Exception('Failed to load data in service');
//  }
//}

// Rest api connection -- end
}