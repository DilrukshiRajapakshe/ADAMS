import 'package:flutter/material.dart';
import 'package:medi_line/views/first_view.dart';
import 'package:medi_line/views/home.dart';
import 'package:medi_line/views/home_view.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    FirstView(),
    AddDoctor(),
    HomePage(),
    // ExplorePage(),
    // PastTripsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    //final newTrip = new Trip(null, null, null, null, null);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Medical Center"),
      //   actions: <Widget>[
      //     IconButton(
      //       icon: Icon(Icons.add),
      //       onPressed: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(builder: (context) => FirstView()),
      //         );
      //       },
      //     ),
      //     IconButton(
      //       icon: Icon(Icons.undo),
      //       onPressed: () async {
      //         try {
      //           AuthService auth = Provider.of(context).auth;
      //           await auth.signOut();
      //           print("Signed Out!");
      //         } catch (e) {
      //           print(e);
      //         }
      //       },
      //     )
      //   ],
      // ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text("Home"),
            ),
          ]),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
