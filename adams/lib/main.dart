
import 'dart:io';

import 'package:flutter/material.dart';
import 'UI/bot/bot.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'UI/login/Login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'ADAMS',
      theme: ThemeData(primaryColor: Colors.purple[600]),
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
    );
  }
}


class LoadingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context,AsyncSnapshot<FirebaseUser> snapshot) {
        if(!snapshot.hasData || snapshot.data == null){
          return Login();
        }
        return bot();
      },
    );
  }
}