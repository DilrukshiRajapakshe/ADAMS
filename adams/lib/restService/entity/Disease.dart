class Diseases{
  String id;
  String name;
  String data_updated_at;
  String facts;
  String symptoms;
  String transmission;
  String diagnosis;
  String treatment;
  String prevention;
  String more;
  String is_active;

  Diseases({this.id,this.name,this.data_updated_at,this.facts,this.symptoms,
  this.transmission,this.diagnosis,this.treatment,this.prevention,this.more,this.is_active});


  factory Diseases.fromJson(Map<String, dynamic> json) {

    return new Diseases(
      id: json['id'] as String,
      name: json['name'] as String,
      data_updated_at: json['data_updated_at'] as String,
      facts: json['facts'] as String,
      symptoms: json['symptoms'] as String,
      transmission: json['transmission'] as String,
      diagnosis: json['diagnosis'] as String,
      treatment: json['treatment'] as String,
      prevention: json['prevention'] as String,
      more: json['more'] as String,
      is_active: json['is_active'] as String,
    );

  }
}