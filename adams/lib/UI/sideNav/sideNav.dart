import 'package:adams/Login/LoginService.dart';
import 'package:flutter/material.dart';
import 'appointment/Appointment.dart';
import 'setting/setting.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SideNav extends StatefulWidget {
  @override
  _SideNavState createState() => _SideNavState();
}

class _SideNavState extends State<SideNav> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _userName = "";
  String _userEmail = "";
  String _userUrl = 'https://res.cloudinary.com/sewwandi/image/upload/v1589990314/upload.png';

  @override
  void initState() {
    super.initState();
    initUserState();
  }

  Future<void> initUserState() async {
    final FirebaseUser currentUser = await _auth.currentUser();
    String name = currentUser.displayName;
    String email = currentUser.email;
    String url = currentUser.photoUrl;

    setState(() {
       _userName = name;
       _userEmail = email;
       _userUrl = url;
    });
  }

  @override
  Widget build(BuildContext context) {
    primaryColor: Colors.purple[600];
    return Drawer (
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top:30,
                      bottom: 10
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            _userUrl
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    _userName,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    _userEmail,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              "Appointment",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: (){
              Navigator.of(context).pop();
              Route route = MaterialPageRoute(builder: (context) => Appointment());
              Navigator.push(context, route);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              "Settings",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: (){
                Navigator.of(context).pop();
                Route route = MaterialPageRoute(builder: (context) => Setting());
                Navigator.push(context, route);
            },
          ),
          ListTile(
            leading: Icon(Icons.arrow_back),
            title: Text(
              "Logout",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: (){
              LoginService().signOutGoogle();
              Navigator.of(context).pop();
            },
          ),
        ],
      )
    );
  }
}