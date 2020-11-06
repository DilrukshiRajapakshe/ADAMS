import 'dart:async';

import 'package:adams/Service/Login/Impl/LoginserviceImpl.dart';
import 'package:adams/View/UI/bot/bot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';


// Google singIn page

class Login extends StatefulWidget{
  @override
  _LoginState createState() =>  _LoginState();
}

class _LoginState extends State<Login>{

  var _text= "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 3,
                  child: Image.asset(
                      'assets/images/logo.png',
                      width: 120.0,
                      height: 120.0
                  ),
                ),Expanded(
                  flex: 1,
                  child:Column(
                      children: <Widget>[
                        SignInButton(
                          Buttons.Google,
                          text: "ගූගල් ලියාපදිංචිය",
                          onPressed: () async {
                            bool res = await LoginServiceImpl().signInWithGoogle();
                            if(res == null)
                              print("error logging in with google");
                            else{
                              Navigator.pushReplacement(context, MaterialPageRoute(
                                  builder: (context) => bot()
                              ));
                            }
                          },
                        ),
                      ]
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}