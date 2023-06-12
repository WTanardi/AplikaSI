import 'package:aplika_si/Model/ToDo.dart';
import 'package:aplika_si/Service/Auth_Service.dart';
import 'package:aplika_si/Service/Firestore_Service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ToDoModel extends ChangeNotifier {
  Map<String, Todo> _list = {};

  Map<String, Todo> get list => _list;
  final docRef = FirebaseFirestore.instance.collection('todos').withConverter(
        fromFirestore: Todo.fromFirestore,
        toFirestore: (Todo event, options) => event.toFirestore(),
      );

  // FireStore instance = FireStore('todo', Todo.fromFirestore,
  //     (Todo todo, SetOptions? options) => todo.toFirestore());

  void initData() async {
    print('init todolist');
    final data = await docRef
        .where('userId', isEqualTo: Auth.getAuthUser()!.uid)
        .orderBy('date')
        .get();
    final todos = data.docs.toList();
    _list = {};

    for (QueryDocumentSnapshot<Todo> data in todos) {
      _list.putIfAbsent(data.id, () => data.data());
    }
  }

  void addToDo(String id, Todo todo) async {
    _list.putIfAbsent(
      id,
      () => todo,
    );
    await docRef.doc(id).set(todo);
    notifyListeners();
  }

  void removeToDo(String id) async {
    if (!_list.containsKey(id)) {
      print('there are no this object');
      return;
    }
    docRef.doc(id).delete().then(
          (value) => print('Delete Success'),
          onError: (e) => print('Error while deleting $e'),
        );
    _list.remove(id);
    notifyListeners();
  }
}
