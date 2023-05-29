import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  Event({
    required this.title,
    required this.desc,
    required this.status,
    required this.date,
  });

  String title;
  String desc;
  bool status;
  DateTime date;

  factory Event.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return Event(
      title: data?['title'],
      desc: data?['desc'],
      status: data?['status'],
      date: data?['date'].toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'desc': desc,
      'status': status,
      'date': Timestamp.fromDate(date),
    };
  }
}
