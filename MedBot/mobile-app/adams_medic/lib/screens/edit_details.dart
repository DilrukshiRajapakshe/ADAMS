import 'package:adams_medic/db/detailService.dart';
import 'package:adams_medic/models/details.dart';
import 'package:adams_medic/screens/home_screen.dart';
import 'package:flutter/material.dart';

class EditDetails extends StatefulWidget {
  final Details details;

  EditDetails(this.details);

  @override
  _EditDetailsState createState() => _EditDetailsState();
}

class _EditDetailsState extends State<EditDetails> {
  final GlobalKey<FormState> formkey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Details"),
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
                  initialValue: widget.details.name,
                  decoration: InputDecoration(
                      labelText: "Doctor Name", border: InputBorder.none),
                  onSaved: (val) => widget.details.name = val,
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
                  initialValue: widget.details.hospital,
                  decoration: InputDecoration(
                      labelText: "Hospital", border: InputBorder.none),
                  onSaved: (val) => widget.details.hospital = val,
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
                  initialValue: widget.details.location,
                  decoration: InputDecoration(
                      labelText: "Location", border: InputBorder.none),
                  onSaved: (val) => widget.details.location = val,
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
                  initialValue: widget.details.patient,
                  decoration: InputDecoration(
                      labelText: "Patient", border: InputBorder.none),
                  onSaved: (val) => widget.details.patient = val,
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
                  initialValue: widget.details.specialization,
                  decoration: InputDecoration(
                      labelText: "Specialization", border: InputBorder.none),
                  onSaved: (val) => widget.details.specialization = val,
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
                  initialValue: widget.details.time,
                  decoration: InputDecoration(labelText: "Time"),
                  onSaved: (val) => widget.details.time = val,
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
          //Navigator.pop(context);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
        child: Icon(
          Icons.edit,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
        tooltip: "Edit Doctor details",
      ),
    );
  }

  void insertDetails() {
    final FormState form = formkey.currentState;
    if (form.validate()) {
      form.save();
      form.reset();

      DetailService detailService = DetailService(widget.details.toMap());
      detailService.updateDetails();
    }
  }
}
