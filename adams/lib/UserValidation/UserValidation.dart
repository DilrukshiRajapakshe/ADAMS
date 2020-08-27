import 'package:adams/UserInfo/UserEmail.dart';
import 'package:adams/UserInfo/UserName.dart';
import '../Session/Dialog.dart';

Future<String> userValidationInit(String session) async {
  String email = await getUserEmail();
  String name = await getUserName();

  return question1;
}

Future<bool> userValidation(String answer) async {
  String email = await getUserEmail();
  String name = await getUserName();

  return true;
}