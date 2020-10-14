import 'package:adams/UserInfo/UserEmail.dart';
import 'package:adams/UserInfo/UserName.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class User_Info extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _User_InfoState();
  }
}

class _User_InfoState extends State<User_Info> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 10.0, height: 2.0,);
  var emailField = TextEditingController();
  var userNameField = TextEditingController();
  var NIC_Number = TextEditingController();
  var Secret_key = TextEditingController();
  var patient_Title = TextEditingController();
  var Birthday = TextEditingController();
  var phone_number = TextEditingController();
  var Blood_Group = TextEditingController();


  @override
  Future<void> initState() {
    super.initState();
    getUsername();
    getUserEmails();
    initUserState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView (
        child :Container(
            color: Colors.white,
            child: SafeArea(
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Center(
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
                                                  width: 50.0,
                                                  height: 50.0
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
                                                padding: EdgeInsets.all(5.0),
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
                    ),Center(
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
                                        contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                                        hintText: "Name",
                                    ),
                                    controller: emailField,
                                    )
                                ],
                              ),
                            ),
                            Card(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  TextField(
                                    obscureText: false,
                                    style: style,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                                        hintText: "Email",
                                    ),
                                    controller: userNameField,
                                  )
                                ],
                              ),
                            ),
                            Card(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  TextField(
                                    obscureText: false,
                                    style: style,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                                        hintText: "NIC number",
                                    ),
                                    controller: NIC_Number,
                                  )
                                ],
                              ),
                            ),
                            Card(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  TextField(
                                    obscureText: false,
                                    style: style,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                                        hintText: "Secret key",
                                    ),
                                    controller: Secret_key,
                                  )
                                ],
                              ),
                            ),
                            Card(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  TextField(
                                    obscureText: false,
                                    style: style,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                                        hintText: "Patient Title",
                                    ),
                                    controller: patient_Title,
                                  )
                                ],
                              ),
                            ),
                            Card(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  TextField(
                                    obscureText: false,
                                    style: style,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                                        hintText: "Birthday",
                                    ),
                                    controller: Birthday,
                                  )
                                ],
                              ),
                            ),
                            Card(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  TextField(
                                    obscureText: false,
                                    style: style,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                                        hintText: "Phone Number",
                                    ),
                                    controller: phone_number,
                                  )
                                ],
                              ),
                            ),
                            Card(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  TextField(
                                    obscureText: false,
                                    style: style,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                                        hintText: "Blood Group",
                                    ),
                                    controller: Blood_Group,
                                  )
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
      ),
    );
  }

  Future<void> getUsername() async {
    String name = await getUserName();
    setState(() {
      userNameField.text =name;
    });
  }
  Future<void> getUserEmails() async {
    String email = await getUserEmail();
    setState(() {
      emailField.text = email;
    });
  }

  Future<void> initUserState() async {
    final FirebaseUser currentUser = await _auth.currentUser();
    String name = currentUser.displayName;
    String email = currentUser.email;
    print(name);
    print(email);
  }
}