import 'package:adams/UserValidation/UserValidation.dart';
import 'package:adams/Session/Dialog.dart';
import 'package:adams/restService/restServiceImpl.dart';
import 'package:http/http.dart' as http;

String mainRunner( String userAnswer, session) {

    if(num_list_1.contains(userAnswer)){
      userAnswer = "අංක එක";
    }
    else if(num_list_2.contains(userAnswer)){
      userAnswer = "අංක දෙක";
    }
    else if(num_list_3.contains(userAnswer)){
      userAnswer = "අංක තුන";
    }
    else if(num_list_4.contains(userAnswer)){
      userAnswer = "අංක හතර";
    }
    else if(num_list_5.contains(userAnswer)){
      userAnswer = "අංක පහ";
    }else{
      userAnswer = userAnswer;
    }
  return userAnswer;
}

String mainRunnerSession(String userAnswer, session) {
  if(num_list_1.contains(userAnswer)){
    session = "1";
  }
  else if(num_list_2.contains(userAnswer)){
    session = "2";
  }
  else if(num_list_3.contains(userAnswer)){
    session = "3";
  }
  else if(num_list_4.contains(userAnswer)){
    session = "4";
  }
  else if(num_list_5.contains(userAnswer)){
    session = "5";
  }else{
    session = session;
  }
  return session;
}







