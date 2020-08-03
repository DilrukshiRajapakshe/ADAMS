import 'package:adams/Login/LoginserviceImpl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class Login extends StatefulWidget{
  @override
  _LoginState createState() =>  _LoginState();
}

class _LoginState extends State<Login>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 40.00),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 155,
                  height: 150,
                  padding: EdgeInsets.all(50),
                  margin: EdgeInsets.only(
                      top:30,
                      bottom: 10
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://res.cloudinary.com/sewwandi/image/upload/v1594310247/Untitled-2.png"
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 100.00),
              Align(
                  alignment: Alignment.center,
                  child: SignInButton(
                    Buttons.Google,
                    text: "Sign up with Google",
                    onPressed: () async {
                      bool res = await LoginServiceImpl().signInWithGoogle();
                      if(Map == null)
                        print("error logging in with google");
                    },
                  ),
              ),
              const SizedBox(height: 170.00),
              Align(
                alignment: Alignment.center,
                child: Text("From",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black38,
                    )
                )
              ),
              Align(
                  alignment: Alignment.center,
                  child: Text("ADAMS",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.purple[600],
                    )
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }

}