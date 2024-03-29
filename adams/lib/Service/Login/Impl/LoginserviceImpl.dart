import 'package:adams/Service/Login/LoginService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginServiceImpl implements LoginService{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

//  @override
//  Future<bool> signInWithGoogleEmail(String email, String password) async{
//    try {
//      AuthResult result = await _auth.signInWithEmailAndPassword(email: email,password: password);
//      FirebaseUser user = result.user;
//      assert(!user.isAnonymous);
//      assert(await user.getIdToken() != null);
//      if(user != null)
//        return true;
//      else
//        return false;
//    } catch (e) {
//      print(e.message);
//      return false;
//    }
//  }


//  -----Email singIn --- start -----
  @override
  Future<bool> signInWithGoogle() async {

    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    // testing
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);
    final FirebaseUser currentUser = await _auth.currentUser();

    // testing
    assert(user.uid == currentUser.uid);
    return true;
  }
//  -----Email singIn --- end -----

//  -----Email singOut --- start -----
  @override
  void signOutGoogle() async{
    await _auth.signOut();
    await googleSignIn.signOut();
  }
//  -----Email singOut --- end -----
}