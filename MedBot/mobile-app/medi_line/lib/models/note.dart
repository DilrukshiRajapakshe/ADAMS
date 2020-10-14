class Note {
  final String appID;
  final String doctorName;
  final String specialization;
  final String patient;
  final String hospital;
  final String time;
  final String location;
  final String id;

  Note(
      {this.appID,
      this.doctorName,
      this.specialization,
      this.patient,
      this.time,
      this.location,
      this.hospital,
      this.id,
      String clinicName});

  Note.fromMap(Map<String, dynamic> data, String id)
      : appID = data["appID"],
        doctorName = data['doctorName'],
        specialization = data['specialization'],
        patient = data['patient'],
        time = data['time'],
        hospital = data['hospital'],
        location = data['location'],
        id = id;

  Map<String, dynamic> toMap() {
    return {
      "appID": appID,
      "doctorName": doctorName,
      "specialization": specialization,
      "patient": patient,
      "time": time,
      "location": location,
      "hospital": hospital,
    };
  }
}
