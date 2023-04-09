import 'package:aplika_si/Model/ToDo.dart';
import 'package:flutter/material.dart';

class ToDoModel extends ChangeNotifier {
  final Map<String, Todo> _list = {};

  Map<String, Todo> get list => _list;

  void addToDo(String id, Todo todo) {
    _list.putIfAbsent(
      id,
      () => Todo(
          task: todo.task,
          course: todo.course,
          deadlineDate: todo.deadlineDate,
          deadlineHour: todo.deadlineHour),
    );
    notifyListeners();
  }

  void removeToDo(String id) {
    if (!_list.containsKey(id)) return;
    _list.remove(id);
    notifyListeners();
  }
}
