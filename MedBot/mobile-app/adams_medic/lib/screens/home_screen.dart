import 'package:adams_medic/models/details.dart';
import 'package:adams_medic/screens/view_details.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'add_details.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
  static const routeName = '/home';
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseDatabase _database = FirebaseDatabase.instance;
  String nodeName = "details";
  List<Details> detailList = <Details>[];

  @override
  // ignore: must_call_super
  void initState() {
    _database.reference().child(nodeName).onChildAdded.listen(_childAdded);
    _database.reference().child(nodeName).onChildRemoved.listen(_childRemoves);
    _database.reference().child(nodeName).onChildChanged.listen(_childEdited);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ADAMS Medical"),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black87,
        child: Column(
          children: <Widget>[
            Flexible(
                child: FirebaseAnimatedList(
                    query: _database.reference().child('details'),
                    itemBuilder: (_, DataSnapshot snap,
                        Animation<double> animation, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: ListTile(
                            title: ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailsView(detailList[index])));
                              },
                              title: Text(
                                detailList[index].name,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            subtitle: Text(detailList[index].hospital),
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddDetails()));
        },
        child: Icon(
          Icons.edit,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
        tooltip: "add a Details",
      ),
    );
  }

  _childAdded(Event event) {
    setState(() {
      detailList.add(Details.fromSnapshot(event.snapshot));
    });
  }

  void _childRemoves(Event event) {
    var deletedDetails = detailList.singleWhere((details) {
      return details.key == event.snapshot.key;
    });

    setState(() {
      detailList.removeAt(detailList.indexOf(deletedDetails));
    });
  }

  void _childEdited(Event event) {
    var editedDetails = detailList.singleWhere((details) {
      return details.key == event.snapshot.key;
    });

    setState(() {
      detailList[detailList.indexOf(editedDetails)] =
          Details.fromSnapshot(event.snapshot);
    });
  }
}
