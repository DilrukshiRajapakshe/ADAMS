import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'View/UI/bot/bot.dart';

// main thread
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
      builder: (context,AsyncSnapshot<FirebaseUser> snapshot) {
        return bot();
      },
    );
  }
}
