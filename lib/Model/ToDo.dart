import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Todo {
  String task;
  String course;
  TimeOfDay deadlineHour;
  DateTime deadlineDate;

  Todo(
      {required this.task,
      required this.course,
      required this.deadlineHour,
      required this.deadlineDate});

  factory Todo.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return Todo(
        task: data?['task'],
        course: data?['course'],
        deadlineHour: data?['deadlineHour'],
        deadlineDate: data?['deadlineDate']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      'task': task,
      'course': course,
      'deadlineHour': deadlineHour,
      'deadlineDate': deadlineDate
    };
  }
}
