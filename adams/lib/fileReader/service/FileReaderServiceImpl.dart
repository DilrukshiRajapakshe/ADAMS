import 'dart:async';
import 'dart:core';
import 'dart:convert';
import 'package:flutter/services.dart';


class FileReaderServiceImpl {

  Future<String>_loadFromAsset() async {
    return await rootBundle.loadString("assets/config.json");
  }

  Future parseJson() async {
    String jsonString = await _loadFromAsset();
    final jsonResponse = jsonDecode(jsonString);
    assert(await jsonResponse != null);
    print(jsonResponse);
  }
}
