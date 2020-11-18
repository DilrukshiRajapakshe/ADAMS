import 'package:firebase_database/firebase_database.dart';

class Details {
  static const KEY = "key";
  static const NAME = "name";
  static const HOSPITAL = "hospital";
  static const LOCATION = "location";
  static const PATIENT = "patient";
  static const SPECIALIZATION = "specialization";
  static const TIME = "time";

  String key;
  String name;
  String hospital;
  String location;
  String patient;
  String specialization;
  String time;

  Details(this.name, this.hospital, this.location, this.patient,
      this.specialization, this.time);

  // String get key => _key;
  // String get name => _name;
  // String get hospital => _hospital;
  // String get location => _location;
  // String get patient => _patient;
  // String get specialization => _specialization;
  // String get time => _time;

  Details.fromSnapshot(DataSnapshot snap)
      : this.key = snap.key,
        this.name = snap.value[NAME],
        this.hospital = snap.value[HOSPITAL],
        this.location = snap.value[LOCATION],
        this.patient = snap.value[PATIENT],
        this.specialization = snap.value[SPECIALIZATION],
        this.time = snap.value[TIME];

  Map toMap() {
    return {
      NAME: name,
      HOSPITAL: hospital,
      LOCATION: location,
      PATIENT: patient,
      SPECIALIZATION: specialization,
      TIME: time,
      KEY: key
    };
  }
}
