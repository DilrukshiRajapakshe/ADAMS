import 'dart:async';
import 'dart:core';
import 'dart:convert';
import 'package:flutter/services.dart';

  Future<String>_loadFromAsset() async {
    return await rootBundle.loadString("assets/images/config.json");
  }

  Future parseJson() async {
    String jsonString = await _loadFromAsset();
    final jsonResponse = jsonDecode(jsonString);
    print(jsonResponse);
  }
