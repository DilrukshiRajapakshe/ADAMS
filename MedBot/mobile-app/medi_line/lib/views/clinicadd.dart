import 'package:flutter/material.dart';
import 'package:medi_line/models/note.dart';
import 'package:medi_line/models/notecli.dart';
import 'package:medi_line/services/firestore_service.dart';


class AddClinic extends StatefulWidget {
  final Notecli note2;

  const AddClinic({Key key, this.note2}) : super(key: key);
  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddClinic> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController _appIDController;
  TextEditingController _clinicalController;
  TextEditingController _location;
  TextEditingController _timedate;
  TextEditingController _howmany;
  TextEditingController _hospitalController;
  FocusNode _clinicalNameNode;
  FocusNode _loca;
  FocusNode _time;
  FocusNode _hospi;

  @override
  void initState() {
    super.initState();
    _appIDController =
        TextEditingController(text: isEditMote ? widget.note2.appID : '');
    _clinicalController =
        TextEditingController(text: isEditMote ? widget.note2.clinicName : '');
    _location =
        TextEditingController(text: isEditMote ? widget.note2.location : '');
    _timedate =
        TextEditingController(text: isEditMote ? widget.note2.time : '');
    _howmany =
        TextEditingController(text: isEditMote ? widget.note2.patient : '');
    _hospitalController =
        TextEditingController(text: isEditMote ? widget.note2.hospital : '');
    _clinicalNameNode = FocusNode();
    _loca = FocusNode();
    _time = FocusNode();

    _hospi = FocusNode();
  }

  get isEditMote => widget.note2 != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditMote ? 'Edit Details' : 'Add Clinic Details'),
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
                  FocusScope.of(context).requestFocus(_clinicalNameNode);
                },
                controller: _appIDController,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "Clinical ID cannot be empty";
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Clinical ID",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                focusNode: _clinicalNameNode,
                controller: _clinicalController,
                decoration: InputDecoration(
                  labelText: "clinicName",
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
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: Text(isEditMote ? "Update" : "Save"),
                onPressed: () async {
                  if (_key.currentState.validate()) {
                    try {
                      if (isEditMote) {
                        Note note = Note(
                          appID: _appIDController.text,
                          clinicName: _clinicalController.text,
                          time: _timedate.text,
                          patient: _howmany.text,
                          hospital: _hospitalController.text,
                          location: _location.text,
                          id: widget.note2.id,
                        );
                        await FirestoreService().updateNote(note);
                      } else {
                        Note note = Note(
                          appID: _appIDController.text,
                          clinicName: _clinicalController.text,
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
