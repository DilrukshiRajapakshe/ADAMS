import 'package:flutter/material.dart';
import 'package:medi_line/models/note.dart';


class NoteDetailsPage extends StatelessWidget {
  final Note note;

  const NoteDetailsPage({Key key, @required this.note}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: Text('Details'),
      ),
      body: Container(
        decoration: BoxDecoration(
          
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.purpleAccent, Color(0xffe46b10)])),
        child: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 40.0),
              Row(
                children: [
                  Text(
                    "ID:  ",
                    style: TextStyle(fontSize: 26.0, color: Colors.white),
                  ),
                  Text(
                    note.appID,
                    style: TextStyle(fontSize: 24.0, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              const SizedBox(width: 600.0),
              Row(
                children: [
                  Text(
                    "Doctor Name: ",
                    style: TextStyle(fontSize: 26.0, color: Colors.white),
                  ),
                  Text(
                    note.doctorName,
                    style: TextStyle(fontSize: 24.0, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Text(
                    "Specialization: ",
                    style: TextStyle(fontSize: 26.0, color: Colors.white),
                  ),
                  Text(
                    note.specialization,
                    style: TextStyle(fontSize: 24.0, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Text(
                    "Patient: ",
                    style: TextStyle(fontSize: 26.0, color: Colors.white),
                  ),
                  Text(
                    note.patient,
                    style: TextStyle(fontSize: 24.0, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Text(
                    "Hospital: ",
                    style: TextStyle(fontSize: 26.0, color: Colors.white),
                  ),
                  Text(
                    note.hospital,
                    style: TextStyle(fontSize: 24.0, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Text(
                    "Time: ",
                    style: TextStyle(fontSize: 26.0, color: Colors.white),
                  ),
                  Text(
                    note.time,
                    style: TextStyle(fontSize: 24.0, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Text(
                    "location: ",
                    style: TextStyle(fontSize: 26.0, color: Colors.white),
                  ),
                  Text(
                    note.location,
                    style: TextStyle(fontSize: 24.0, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
