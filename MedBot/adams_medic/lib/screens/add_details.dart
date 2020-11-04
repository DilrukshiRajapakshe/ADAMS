import 'package:adams_medic/db/detailService.dart';
import 'package:adams_medic/models/details.dart';
import 'package:flutter/material.dart';

class AddDetails extends StatefulWidget {
  @override
  _AddDetailsState createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
  final GlobalKey<FormState> formkey = new GlobalKey();
  Details details = Details("", "", "", "", "", "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Details"),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          key: formkey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Doctor Name", border: InputBorder.none),
                  onSaved: (val) => details.name = val,
                  // ignore: missing_return
                  validator: (val) {
                    if (val.isEmpty) {
                      return "Field can't be empty";
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Hospital", border: InputBorder.none),
                  onSaved: (val) => details.hospital = val,
                  // ignore: missing_return
                  validator: (val) {
                    if (val.isEmpty) {
                      return "Field can't be empty";
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Location", border: InputBorder.none),
                  onSaved: (val) => details.location = val,
                  // ignore: missing_return
                  validator: (val) {
                    if (val.isEmpty) {
                      return "Field can't be empty";
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Patient", border: InputBorder.none),
                  onSaved: (val) => details.patient = val,
                  // ignore: missing_return
                  validator: (val) {
                    if (val.isEmpty) {
                      return "Field can't be empty";
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Specialization", border: InputBorder.none),
                  onSaved: (val) => details.specialization = val,
                  // ignore: missing_return
                  validator: (val) {
                    if (val.isEmpty) {
                      return "Field can't be empty";
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: "Time"),
                  onSaved: (val) => details.time = val,
                  // ignore: missing_return
                  validator: (val) {
                    if (val.isEmpty) {
                      return "Field can't be empty";
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          insertDetails();
          Navigator.pop(context);
          //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
        tooltip: "add Doctor details",
      ),
    );
  }

  void insertDetails() {
    final FormState form = formkey.currentState;
    if (form.validate()) {
      form.save();
      form.reset();

      DetailService detailService = DetailService(details.toMap());
      detailService.addDetails();
    }
  }
}
