import 'package:adams/Service/Session/constance.dart';
import 'package:adams/Service/UserValidation/firebase_service.dart';
import 'package:adams/Service/restService/Impl/restServiceImpl.dart';
import 'package:adams/Service/restService/restService.dart';
import '../Session.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class SessionImpl implements Session{

  RestServiceImpl rest = new RestServiceImpl();
  var client = new http.Client();
  var response;
  // user session creation --- start
  Future<String> mainRunner( String userAnswer,String session) async{
    print(userAnswer);
    if(num_list_1.contains(userAnswer)){
      userAnswer = "එක";
    }
    else if(num_list_2.contains(userAnswer)){
      userAnswer = "දෙක";
    }
    else if(num_list_3.contains(userAnswer)){
      userAnswer = "තුන";
    }
    else if("සුභ සැන්දෑවක්" == userAnswer){
      userAnswer = "රහස්‍යනාමය";
      print("1");
      print(userAnswer);
    }
    else{
      userAnswer = userAnswer;
    }
    print(userAnswer);
    String massage = await rest.getRASA(client, userAnswer);
    print(massage);
    return massage;
  }

//  Future<String> mainRunnerSession(String userAnswer, String session, String email) async{
//
//    String value = "";
//    FirebaseServiceSearch firebase = new FirebaseServiceSearch();
//    if(num_list_1.contains(userAnswer)){
//      value = "1";
//    }
//    else if(num_list_2.contains(userAnswer)){
//      value = "2";
//    }
//    else if(num_list_3.contains(userAnswer)){
//      value = "3";
//    }
//    else{
//      value = session;
//      var response = "";
//      if(value == "1"){
//        response = await rest.getAppointmentInfo(client, userAnswer);
//        firebase.updateUserFieldStatus(email, int.parse(value), response);
//      }else if(value == "2"){
//        response = await rest.getOnto(client, userAnswer);
//        firebase.updateUserFieldStatus(email, int.parse(value), response);
//      }
//    }
//    return value;
//  }

  Future<String> mainRunnerSession(String userAnswer, String session) async{
    String value = "";
//    FirebaseServiceSearch firebase = new FirebaseServiceSearch();
    if(num_list_1.contains(userAnswer)){
      value = "1";
    }
    else if(num_list_2.contains(userAnswer)){
      value = "2";
    }
    else if(num_list_3.contains(userAnswer)){
      value = "3";
    }
    else{
      value = session;
    }
    return value;
  }
}