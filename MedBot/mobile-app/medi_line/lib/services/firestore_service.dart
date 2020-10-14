import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medi_line/models/note.dart';

class FirestoreService {
  static final FirestoreService _firestoreService =
      FirestoreService._internal();
  Firestore _db = Firestore.instance;

  FirestoreService._internal();

  factory FirestoreService() {
    return _firestoreService;
  }

  Stream<List<Note>> getNotes() {
    return _db.collection('medical').snapshots().map(
          (snapshot) => snapshot.documents
              .map(
                (doc) => Note.fromMap(doc.data, doc.documentID),
              )
              .toList(),
        );
  }

  Future<void> addNote(Note note) {
    return _db.collection('medical').add(note.toMap());
  }

  Future<void> deleteNote(String id) {
    return _db.collection('medical').document(id).delete();
  }

  Future<void> updateNote(Note note) {
    return _db.collection('medical').document(note.id).updateData(note.toMap());
  }
}
