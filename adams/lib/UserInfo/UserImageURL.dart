import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Future<String> getUserImageURL(String email, String password) async {
  final FirebaseUser currentUser = await _auth.currentUser();
  return currentUser.photoUrl;
}