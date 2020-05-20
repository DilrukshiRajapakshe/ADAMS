import 'package:flutter/material.dart';
import 'bot/bot.dart';
import 'dart:async';

void main(){
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp>{

  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(
      seconds: 3
    ),
        (){
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context)=> bot(),
              )
          );
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[600],
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Image(image: AssetImage('assets/image/logo.png'),
                  width: 350,
                  height: 150,
                ),
            ),
          ],
        ),
      ),
    );
  }
}