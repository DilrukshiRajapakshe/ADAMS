import 'package:flutter/material.dart';

class Profile extends StatelessWidget{

  final String text;
  Profile({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(text),
        ),
      ),
    );
  }

}