import 'dart:convert';

import 'package:http/http.dart' as http;

Future<http.Response> getDiseaseInfo() async {
  final response = await http.get('https://disease-info-api.herokuapp.com/diseases');
  var list = null;
  assert(response != null);
  if (response.statusCode == 200) {
    list = json.decode(response.body) as List;
    assert(list != null);
    assert(response != null);
  } else {
    throw Exception('Failed to load album');
  }

  return response;
}