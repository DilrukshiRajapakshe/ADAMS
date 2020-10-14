import 'package:cloud_firestore/cloud_firestore.dart';

class Notecli {
  final String appID;
  final String clinicName;
  final String specialization;
  final String patient;
  final String hospital;
  final DateTime time;
  final String location;
  final String id;

  Notecli(
      {this.appID,
      this.clinicName,
      this.specialization,
      this.patient,
      this.time,
      this.location,
      this.hospital,
      this.id});

  Notecli.fromMap(Map<String, dynamic> data, String id)
      : appID = data["appID"],
        clinicName = data['doctorName'],
        specialization = data['speci'],
        patient = data['plimit'],
        time = data['time']?.toDate(),
        hospital = data['hospital'],
        location = data['loca'],
        id = id;

  Map<String, dynamic> toMap() {
    return {
      "appID": appID,
      "clinicName": clinicName,
      "speci": specialization,
      "plimit": patient,
      "time": time,
      "loca": location,
      "hospital": hospital,
    };
  }
}
