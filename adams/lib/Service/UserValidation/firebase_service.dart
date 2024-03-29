import 'package:adams/Module/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:translator/translator.dart';

//firebase firestore handling db connectivity
class FirebaseServiceSearch {
  static final FirebaseServiceSearch _firestoreService =
      FirebaseServiceSearch._internal();
  final Firestore _db = Firestore.instance;
  String doccId = '';

  FirebaseServiceSearch._internal();

  factory FirebaseServiceSearch() {
    return _firestoreService;
  }

  Stream<List<User>> checkUserExist(String email) {
    return _db
        .collection('User')
        .where('email', isEqualTo: email)
        .snapshots()
        .map(
          (snapshot) => snapshot.documents
              .map(
                (doc) => User.fromMap(doc.data, doc.documentID),
              )
              .toList(),
        );
  }

//query for current status checking
  String _statusCheck(int statusId) {
    String result = '';
    if (statusId == 1 || statusId == 2) {
      return 'proccessing';
    } else {
      return 'completed';
    }
  }

  Future<String> checkDataByEmail(String email, int statusId) async {
    String documentId = "";

    //status checking
    String status = _statusCheck(statusId);

    //get current date time
    DateTime dt = DateTime.now();
    DateFormat fm = DateFormat('yyyy-MM-dd HH:mm:ss');

    int len = 0;
    await Firestore.instance
        .collection("User")
        .limit(1)
        .where('email', isEqualTo: email)
        .getDocuments()
        .then((value) {
      List<DocumentSnapshot> user = value.documents;
      len = user.length;
    });

    if (len == 0) {
      documentId = await addUSerData(new User(
          email: email, datetime: fm.format(dt), newUser: true, logincount: 1));
    } else {
      documentId = await addUSerData(new User(
          email: email,
          datetime: fm.format(dt),
          newUser: false,
          logincount: len + 1));
    }

    return documentId;
  }

  Future<String> addUSerData(User user) async {
    DocumentReference docRef =
        await Firestore.instance.collection('User').add(user.toMap());
    print(docRef.documentID);
    print('added diId, ${docRef.documentID}');
    return docRef.documentID;
  }

  //capturing important facts
  Future<String> updateUserFieldStatus(
      String documentId, int statusId, String importantFact) async {
    String result = _statusCheck(statusId);
    print('statusid $statusId');
    try {
      Map<String, String> data = new Map();
      data['status'] = result;
      print('result - $result');
      if (statusId == 1) {
        data['important_fact'] = importantFact;
      }
      print('data - $data');
      await Firestore.instance
          .collection("User")
          .document(documentId)
          .updateData(data);
      result = 'success';
    } catch (e) {
      print(e);
    }
    return result;
  }

  //English to Sinhala translator
  //Translate importantFacts into Sinhala language
  Future<String> engToSinhala(String text) async {
    String res = '';

    final translator = GoogleTranslator();
    await translator.translate(text, from: 'en', to: 'si').then((value) {
      res = value.toString();
    });

    return res;
  }
}
