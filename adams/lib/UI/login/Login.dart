import 'package:adams/Login/LoginserviceImpl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class Login extends StatefulWidget{
  @override
  _LoginState createState() =>  _LoginState();
}

class _LoginState extends State<Login>{

  TextEditingController _emailCtrl;
  TextEditingController _passwordCtrl;

  @override
  void initState() {
    super.initState();
    _emailCtrl = TextEditingController(text: "");
    _passwordCtrl = TextEditingController(text: "");
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
              const SizedBox(height: 100.00,),
              Text(
                "Login",
                style: TextStyle(
                  fontSize: 25.00,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 20.00,),
              TextField(
                controller: _emailCtrl,
                decoration: InputDecoration(
                  hintText: "Email"
                ),
              ),
              const SizedBox(height: 11.00),
              TextField(
                controller: _passwordCtrl,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Password"
                ),
              ),
              const SizedBox(height: 20.00),
              Align(
                  alignment: Alignment.center,
                  child:RaisedButton(
                    child: Text("Login"),
                    onPressed: ()async {
                      if(_emailCtrl.text.isEmpty || _passwordCtrl.text.isEmpty) {
                        print("Email and password are empty");
                        return;
                      }
                      bool res = await LoginServiceImpl().signInWithGoogleEmail(_emailCtrl.text, _passwordCtrl.text);
                      if(!res) {
                        print("Login failed");
                      }
                    },
                  ),
              ),
              const SizedBox(height: 40.00),
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
            ],
          ),
        ),
      ),
    );
  }

}