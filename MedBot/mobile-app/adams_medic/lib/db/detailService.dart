import 'package:firebase_database/firebase_database.dart';

class DetailService {
  String nodeName = "details";
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference _databaseReference;
  Map details;

  DetailService(this.details);

  addDetails() {
    //this is going to give reference to details node

    _databaseReference = database.reference().child(nodeName);
    _databaseReference.push().set(details);
  }

  deleteDetails() {
    _databaseReference = database.reference().child(nodeName);
    database.reference().child('$nodeName/${details['key']}').remove();
  }

  updateDetails() {
    database.reference().child('$nodeName/${details['key']}').update({
      "name": details['name'],
      "hospital": details['hospital'],
      "location": details['location'],
      "patient": details['patient'],
      "specialization": details['specialization'],
      "time": details['time'],
    });
  }
}
