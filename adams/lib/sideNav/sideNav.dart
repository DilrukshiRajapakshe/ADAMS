import 'package:flutter/material.dart';
import 'setting/setting.dart';
import 'profile/profile.dart';

class SideNav extends StatelessWidget{

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
                        image: NetworkImage('https://res.cloudinary.com/sewwandi/image/upload/v1589990314/upload.png'),
                        fit:BoxFit.fill,
                      ),
                    ),
                  ),
                  Text(
                      "Name",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                  ),
                  Text(
                    "Email",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                          Icons.edit,
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
              "Profile",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: (){
              Navigator.of(context).pop();
              Route route = MaterialPageRoute(builder: (context) => Profile());
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
            onTap: null,
          ),
        ],
      )
    );
  }
}