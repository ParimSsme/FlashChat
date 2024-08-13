import 'package:cloud_firestore/cloud_firestore.dart';

class ChatApiProvider {
  FirebaseFirestore fireStore;
  ChatApiProvider(this.fireStore);

  Stream<QuerySnapshot<Map<String, dynamic>>> callMessages() {
    return fireStore
        .collection('messages')
        .orderBy('date', descending: false)
        .snapshots();
  }
}
