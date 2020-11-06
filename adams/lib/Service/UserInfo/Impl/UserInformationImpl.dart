
import 'package:firebase_auth/firebase_auth.dart';

import '../UserInformation.dart';


class UserInformationImpl implements UserInformation{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Future<String> getUserEmail() async {
    final FirebaseUser currentUser = await _auth.currentUser();
    return currentUser.email;
  }

  @override
  Future<String> getUserImageURL() async {
    final FirebaseUser currentUser = await _auth.currentUser();
    return currentUser.photoUrl;
  }

  @override
  Future<String> getUserName() async {
    final FirebaseUser currentUser = await _auth.currentUser();
    return currentUser.displayName;
  }


}