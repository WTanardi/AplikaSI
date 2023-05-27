import 'package:aplika_si/Extension/DateTimeExtension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Todo {
  String userId;
  String task;
  String course;
  TimeOfDay deadlineHour;
  DateTime deadlineDate;

  Todo(
      {required this.userId,
      required this.task,
      required this.course,
      required this.deadlineHour,
      required this.deadlineDate});

  factory Todo.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return Todo(
      userId: data?['userId'],
      task: data?['task'],
      course: data?['course'],
      deadlineDate: data?['deadlineDate'].toDate(),
      deadlineHour: TimeOfDay.fromDateTime(
        data?['deadlineHour'].toDate(),
      ),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'task': task,
      'course': course,
      'deadlineHour': Timestamp.fromDate(deadlineDate.applied(deadlineHour)),
      'deadlineDate': Timestamp.fromDate(deadlineDate)
    };
  }
}
