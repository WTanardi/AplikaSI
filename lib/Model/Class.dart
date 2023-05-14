import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Class {
  Class({
    required this.course,
    required this.day,
    required this.room,
    required this.startTime,
    required this.endTime,
  });

  String course;
  String room;
  DateTime day;
  int startTime, endTime;

  factory Class.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return Class(
      course: data?['course'],
      day: data?['day'],
      room: data?['room'],
      startTime: data?['startTime'],
      endTime: data?['endTime'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'course': course,
      'day': day,
      'room': room,
      'startTime': startTime,
      'endTime': endTime,
    };
  }
}
