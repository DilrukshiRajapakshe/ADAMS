import 'package:flutter/material.dart';
import 'package:medi_line/models/note.dart';
import 'package:medi_line/services/firestore_service.dart';


class AddDoctor extends StatefulWidget {
  final Note note;

  const AddDoctor({Key key, this.note}) : super(key: key);
  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddDoctor> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController _appIDController;
  TextEditingController _doctorNameController;
  TextEditingController _location;
  TextEditingController _timedate;
  TextEditingController _spec;
  TextEditingController _howmany;
  TextEditingController _hospitalController;
  FocusNode _doctorNameNode;
  FocusNode _loca;
  FocusNode _time;
  FocusNode _speci;
  FocusNode _howman;
  FocusNode _hospi;

  @override
  void initState() {
    super.initState();
    _appIDController =
        TextEditingController(text: isEditMote ? widget.note.appID : '');
    _doctorNameController =
        TextEditingController(text: isEditMote ? widget.note.doctorName : '');
    _location =
        TextEditingController(text: isEditMote ? widget.note.location : '');
    _timedate = TextEditingController(text: isEditMote ? widget.note.time : '');
    _spec = TextEditingController(
        text: isEditMote ? widget.note.specialization : '');
    _howmany =
        TextEditingController(text: isEditMote ? widget.note.patient : '');
    _hospitalController =
        TextEditingController(text: isEditMote ? widget.note.hospital : '');
    _doctorNameNode = FocusNode();
    _loca = FocusNode();
    _time = FocusNode();
    _speci = FocusNode();
    _howman = FocusNode();
    _hospi = FocusNode();
  }

  get isEditMote => widget.note != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.purpleAccent,
        title: Text(isEditMote ? 'Edit Details' : 'Add Doctor'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                textInputAction: TextInputAction.next,
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(_doctorNameNode);
                },
                controller: _appIDController,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "Doctor ID cannot be empty";
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Doctor ID",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                focusNode: _doctorNameNode,
                controller: _doctorNameController,
                decoration: InputDecoration(
                  labelText: "doctorName",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                focusNode: _speci,
                controller: _spec,
                decoration: InputDecoration(
                  labelText: "Specialization",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                focusNode: _time,
                controller: _timedate,
                decoration: InputDecoration(
                  labelText: "Channel Time",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                focusNode: _howman,
                controller: _howmany,
                decoration: InputDecoration(
                  labelText: "Daily Pation Limit",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                focusNode: _hospi,
                controller: _hospitalController,
                decoration: InputDecoration(
                  labelText: "Medical Center",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                focusNode: _loca,
                controller: _location,
                decoration: InputDecoration(
                  labelText: "location",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),
              RaisedButton(
                color: Colors.purpleAccent,
                textColor: Colors.white,
                child: Text(isEditMote ? "Update" : "Save"),
                onPressed: () async {
                  if (_key.currentState.validate()) {
                    try {
                      if (isEditMote) {
                        Note note = Note(
                          appID: _appIDController.text,
                          doctorName: _doctorNameController.text,
                          specialization: _spec.text,
                          time: _timedate.text,
                          patient: _howmany.text,
                          hospital: _hospitalController.text,
                          location: _location.text,
                          id: widget.note.id,
                        );
                        await FirestoreService().updateNote(note);
                      } else {
                        Note note = Note(
                          appID: _appIDController.text,
                          doctorName: _doctorNameController.text,
                          specialization: _spec.text,
                          time: _timedate.text,
                          patient: _howmany.text,
                          hospital: _hospitalController.text,
                          location: _location.text,
                        );
                        await FirestoreService().addNote(note);
                      }
                      Navigator.pop(context);
                    } catch (e) {
                      print(e);
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
