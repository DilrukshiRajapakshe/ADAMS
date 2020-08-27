import 'package:adams/UserValidation/UserValidation.dart';
import 'package:adams/Session/Dialog.dart';

Future<String> mainRunner(String botQuestion, String userAnswer, session) async{

  if(num_list_1.contains(userAnswer) && question_list_1.contains(botQuestion) && session == "0"){
    userAnswer = "අංක එක";
    session = "1";
  }
  else if(num_list_2.contains(userAnswer) && question_list_1.contains(botQuestion) && session == "0"){
    userAnswer = "අංක දෙක";

    session = "2";
  }
  else if(num_list_3.contains(userAnswer) && question_list_1.contains(botQuestion) && session == "0"){
    userAnswer = "අංක තුන";
    session = "3";
  }
  else if(num_list_4.contains(userAnswer) && question_list_1.contains(botQuestion) && session == "0"){
    userAnswer = "අංක හතර";
    session = "4";
  }
  else if(num_list_5.contains(userAnswer) && question_list_1.contains(botQuestion) && session == "0"){
    userAnswer = "අංක පහ";
    session = "5";
  }else if(question_list.contains(botQuestion) && session == "0" ){
    userAnswer = "රහස්‍යනාමය";
    session = "0";
    bool validation = await userValidation(session);
  }else if(yes_list.contains(userAnswer)){
    userAnswer = "ඔව්";
    session = "6";
  } else if(no_list.contains(userAnswer)){
    userAnswer = "නැත";
    session = "0";
  }else if(session == "2"){
    userAnswer = "";
  } else if(session == "3"){
    userAnswer = "";
  } else if(session == "4"){
    userAnswer = "";
  }else{
    session = session;
    userAnswer = userAnswer;
  }
  print(session);
  print(userAnswer);
  return session;
}