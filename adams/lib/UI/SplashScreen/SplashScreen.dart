import 'dart:async';
import 'package:adams/UI/bot/bot.dart';
import 'package:adams/UI/login/Login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Splash_Screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashState();
  }

}


class _SplashState extends State<Splash_Screen> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  var _user;
  @override
  void initState() {
    super.initState();
    initUserState();
    loding_Time();
  }

  loding_Time(){
    var _duration = new Duration(seconds: 6);
    return new Timer(_duration, navigate);
  }

  Future<void> initUserState() async {
    final FirebaseUser currentUser = await _auth.currentUser();
    print(currentUser);
    setState(() {
      _user = currentUser;
    });
  }

  navigate(){
    if(_user == null){
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => Login()
      )
      );
    }
    else{
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => bot()
      )
      );
    }
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
                  child:Image.asset(
                      'assets/images/logo.png',
                      width: 120.0,
                      height: 120.0
                  ),
                ),
                Expanded(
                  flex: 1,
                  child:Column(
                      children: <Widget>[
                        Text("From",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black38,
                            )
                        ),
                        Text("ADAMS",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.indigo,
                            )
                        )
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