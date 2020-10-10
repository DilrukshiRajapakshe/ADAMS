import 'package:adams/UserInfo/UserName.dart';
import 'package:flutter/material.dart';

class User_Info extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _User_InfoState();
  }
}

class _User_InfoState extends State<User_Info> {

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  var emailField = TextEditingController();

  @override
  Future<void> initState() {
    super.initState();
    getUsername();
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
                  flex: 1,
                  child:Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Center(
                            child:Column(
                                children: [
                                    Column(
                                        children: <Widget>[
                                          Image.asset(
                                              'assets/images/logo.png',
                                              width: 30.0,
                                              height: 30.0
                                          ),
                                          Text("ADAMS",
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.indigo,
                                              )
                                          )
                                      ]
                                  ),
                                  Column(
                                      children: <Widget>[
                                        Padding (
                                            padding: EdgeInsets.all(16.0),
                                            child : Text("User Information",
                                              style: TextStyle(
                                                fontSize: 30,
                                                color: Colors.indigo,
                                              ),
                                            )
                                        )
                                      ]
                                  )
                                ]
                            )
                        )
                      ]
                  ),
                ),Expanded(
                  flex:3,
                  child:Column(
                      children: <Widget>[
                        Card(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              TextField(
                              obscureText: false,
                                style: style,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                    hintText: "Name",
                                    border:
                                    OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                              )
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const ListTile(
                                leading: Icon(Icons.album, size: 50),
                                title: Text('Heart Shaker'),
                                subtitle: Text('TWICE'),
                              ),
                            ],
                          ),
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
  getUsername() async {
    return emailField.text = await getUserName();
  }
  getUserEmail() async {
    return emailField.text = await getUserName();
  }
}