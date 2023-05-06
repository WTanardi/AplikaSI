import 'package:aplika_si/Model/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStore {
  static var db = FirebaseFirestore.instance;

  // static User? getUser(String email) async {
  //   final docRef = db.collection('users').where('email', isEqualTo: email);
  //   final docSnap = await docRef.get();
  //   final data = docSnap.docs;
  //   final options = SnapshotOptions();
  //   return User.fromFirestore(data.single, options);
  // }

  static Future<User> getUser(String email) async {
    final docRef = db.collection('users').where('email', isEqualTo: email);
    final docSnap = await docRef.get();
    final data = docSnap.docs.single;
    final options = SnapshotOptions();
    print(data.data());
    return User.fromFirestore(data, options);
  }

  static Future<Object?> getData(
      String collection, var from, var to, String key) async {
    final docRef = db
        .collection(collection)
        .withConverter(fromFirestore: from, toFirestore: to)
        .doc(key);

    final docSnap = await docRef.get();
    final data = docSnap.data();
    if (data != null) {
      print(data);
    } else {
      print('No such document');
    }
    return data;
  }
}
