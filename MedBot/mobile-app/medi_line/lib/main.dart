import 'package:flutter/material.dart';
import 'package:medi_line/services/auth_service.dart';
import 'package:medi_line/views/first_view.dart';
import 'package:medi_line/views/home_view.dart';
import 'package:medi_line/views/sign_up_view.dart';
import 'package:medi_line/widgets/provider_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      auth: AuthService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "ADAMS medical",
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: SignUpView(),
        //  HomeController(),
        routes: <String, WidgetBuilder>{
          '/signUp': (BuildContext context) =>
              SignUpView(authFormType: AuthFormType.signUp),
          '/signIn': (BuildContext context) =>
              SignUpView(authFormType: AuthFormType.signIn),
          '/home': (BuildContext context) => HomePage(),
        },
      ),
    );
  }
}

class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of(context).auth;
    return StreamBuilder<String>(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          return signedIn ? FirstView() : HomePage();
        }
        return CircularProgressIndicator();
      },
    );
  }
}
