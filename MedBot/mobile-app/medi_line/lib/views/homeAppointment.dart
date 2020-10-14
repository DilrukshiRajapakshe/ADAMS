import 'package:flutter/material.dart';
import 'package:medi_line/models/note.dart';
import 'package:medi_line/services/firestore_service.dart';


import 'home.dart';
import 'home_view.dart';
import 'note_details.dart';

class HomeAppointment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: Text('Doctor Details'),
      ),
      body: StreamBuilder(
        stream: FirestoreService().getNotes(),
        builder: (BuildContext context, AsyncSnapshot<List<Note>> snapshot) {
          if (snapshot.hasError || !snapshot.hasData)
            return CircularProgressIndicator();
          return Container(
            decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey.shade200,
                      offset: Offset(2, 4),
                      blurRadius: 5,
                      spreadRadius: 2
                  )
                ],
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.purpleAccent, Color(0xffe46b10)]
                )
            ),
            child: ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                Note note = snapshot.data[index];
                return Container(
                  child: ListTile(
                    title: Text(
                      note.appID,
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                    subtitle: Text(
                      note.doctorName,
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          color: Colors.blue,
                          icon: Icon(Icons.edit),
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => HomePage(),
                              )),
                        ),
                        IconButton(
                          color: Colors.orange[900],
                          icon: Icon(Icons.delete),
                          onPressed: () => _deleteNote(context, note.id),
                        ),
                      ],
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => NoteDetailsPage(
                          note: note,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purpleAccent,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => AddDoctor()));
        },
      ),
    );
  }

  void _deleteNote(BuildContext context, String id) async {
    if (await _showConfirmationDialog(context)) {
      try {
        await FirestoreService().deleteNote(id);
      } catch (e) {
        print(e);
      }
    }
  }

  Future<bool> _showConfirmationDialog(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => AlertDialog(
              content: Text("Are you sure you want to delete?"),
              actions: <Widget>[
                FlatButton(
                  textColor: Colors.red,
                  child: Text("Delete"),
                  onPressed: () => Navigator.pop(context, true),
                ),
                FlatButton(
                  textColor: Colors.black,
                  child: Text("No"),
                  onPressed: () => Navigator.pop(context, false),
                ),
              ],
            ));
  }
}
