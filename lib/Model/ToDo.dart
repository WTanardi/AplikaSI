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
}
