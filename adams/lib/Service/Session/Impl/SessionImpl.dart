import 'package:adams/Service/Session/constance.dart';


import '../Session.dart';

class SessionImpl implements Session{
  // user session creation --- start
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
    else{
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
    else{
      session = session;
    }
    return session;
  }
}