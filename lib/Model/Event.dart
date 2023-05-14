import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  Event({
    required this.title,
    required this.desc,
    required this.status,
  });

  String title;
  String desc;
  bool status;

  factory Event.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return Event(
      title: data?['title'],
      desc: data?['desc'],
      status: data?['status'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'desc': desc,
      'status': status,
    };
  }
}
