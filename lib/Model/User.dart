import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String email;
  String username;
  String phone;
  bool isCommittee;
  String field;
  int semester;

  User({
    required this.email,
    required this.username,
    required this.phone,
    required this.isCommittee,
    required this.field,
    required this.semester,
  });

  factory User.fromFirestore(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return User(
        email: data['email'],
        username: data['username'],
        phone: data['phone'],
        isCommittee: data['isCommittee'],
        field: data['field'],
        semester: data['semester']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      'email': email,
      'username': username,
      'phone': phone,
      'iscCommittee': isCommittee,
      'field': field,
      'semester': semester,
    };
  }
}
