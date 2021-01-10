import 'dart:async';
import 'dart:core';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:adams/Service/fileReader/constance/JsonPath.dart';


// json file reader
  Future<String> _loadFromAsset() async {
    return await rootBundle.loadString(JSON_PATH_URL);
  }

  Future<String> parseJson(String service) async {
    String jsonString = await _loadFromAsset();
    final jsonResponse = jsonDecode(jsonString);
    for (var value in jsonResponse) {
      if (value['service'] == service) return (value['url']);
    }
    return 'Invalid service';
  }
