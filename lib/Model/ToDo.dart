import 'package:aplika_si/Extension/DateTimeExtension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Todo {
  String userId;
  String task;
  String course;
  TimeOfDay hour;
  DateTime date;

  Todo(
      {required this.userId,
      required this.task,
      required this.course,
      required this.hour,
      required this.date});

  factory Todo.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return Todo(
      userId: data?['userId'],
      task: data?['task'],
      course: data?['course'],
      date: data?['date'].toDate(),
      hour: TimeOfDay.fromDateTime(
        data?['hour'].toDate(),
      ),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'task': task,
      'course': course,
      'hour': Timestamp.fromDate(date.applied(hour)),
      'date': Timestamp.fromDate(date)
    };
  }
}
