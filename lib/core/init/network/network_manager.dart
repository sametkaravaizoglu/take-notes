import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_uuid/device_uuid.dart';
import 'package:note_app/app/data/models/note_model.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager get instance {
    _instance ??= NetworkManager._init();
    return _instance!;
  }

  String? uid;

  NetworkManager._init() {
    initNetworkManager();
  }

  initNetworkManager() async {
    uid = await DeviceUuid().getUUID();
  }

  final CollectionReference usersRef = FirebaseFirestore.instance.collection("users");

  Future<List<Note>> getAllNotesWithUid() async {
    List<Note> notes = [];
    if (uid == null) {
      return notes;
    }
    QuerySnapshot<Map<String, dynamic>> data = await usersRef.doc(uid).collection("notes").orderBy("timestamp",descending: true).get();

    for (int i = 0; i < data.docs.length; i++) {
      Map<String, dynamic> note = data.docs[i].data();
      note["id"] = data.docs[i].id;
      notes.add(Note.fromJson(note));
    }

    return notes;
  }

  Future<Note?> getNoteDetail(String noteId) async {
    if (uid == null) {
      return null;
    }
    DocumentSnapshot<Map<String, dynamic>> data = await usersRef.doc(uid).collection("notes").doc(noteId).get();
    Map<String, dynamic>? note = data.data();
    note?["id"] = data.id;
    return Note.fromJson(note);
  }

  Future<DocumentReference<Map<String, dynamic>>> addNote({
    required String title,
    required String description,
  }) async {
    return await usersRef.doc(uid).collection("notes").add(
      {
        "title": title,
        "description": description,
        "timestamp": DateTime.now().millisecondsSinceEpoch,
      },
    );
  }

  Future<void> updateNote({
    required String title,
    required String description,
    required String docId,
  }) async {
    return await usersRef.doc(uid).collection("notes").doc(docId).update(
      {
        "title": title,
        "description": description,
        "timestamp": DateTime.now().millisecondsSinceEpoch,
      },
    );
  }

  Future<void> removeNote({
    required String docId,
  }) async {
    return await usersRef.doc(uid).collection("notes").doc(docId).delete();
  }
}
