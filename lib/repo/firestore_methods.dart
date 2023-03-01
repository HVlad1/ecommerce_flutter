import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDataService {
  Future getDocId(List<String> orderId) async {
    await FirebaseFirestore.instance
        .collection('checkout')
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              orderId.add(element.reference.id);
            }));
  }
}