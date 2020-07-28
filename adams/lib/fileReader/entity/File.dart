class JFile{
  String service;
  String url;
  String type;

  JFile({this.service, this.url, this.type});

  factory JFile.fromJson(Map<String, dynamic> json) {
    return new JFile(
      service: json['service'] as String,
      url: json['url'] as String,
      type: json['type'] as String,
    );
  }
}