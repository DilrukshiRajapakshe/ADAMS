//variable initializaion
class User {
  final String id;
  final String email;
  final String password;
  final String datetime;
  final String status;
  final bool newUser;
  final int logincount;

  User(
      {this.id,
      this.email,
      this.password,
      this.datetime,
      this.status,
      this.newUser,
      this.logincount});

  User.fromMap(Map<String, dynamic> data, documentId)
      : email = data["email"],
        password = data["password"],
        datetime = data["datetime"],
        status = data["status"],
        newUser = data["newUser"],
        logincount = data["logincount"],
        id = documentId;

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "email": email,
      "password": password,
      "datetime": datetime,
      "status": status,
      "newUser": newUser,
      "logincount": logincount
    };
  }
}
