import 'package:http/http.dart' as http;
class RestService{
  Future<String> getDrug(http.Client client,data)async{}
  Future<String> getDisease(http.Client client,data) async{}
  Future<String> getAppointmentInfo(http.Client client,data) async {}
  Future<String> getRASA(http.Client client, data) async {}
  Future<String> setRASA(http.Client client, data) async {}

}