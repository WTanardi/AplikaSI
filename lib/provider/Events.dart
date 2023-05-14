import 'package:aplika_si/Service/Firestore_Service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:aplika_si/Model/Event.dart';

class Events extends ChangeNotifier {
  final Map<String, Event> _events = {};
  final docRef = FirebaseFirestore.instance.collection('events').withConverter(
      fromFirestore: Event.fromFirestore,
      toFirestore: (Event event, options) => event.toFirestore());

  Map<String, Event> get events => _events;

  void initData() async {
    final dataRef = await docRef.where('status', isEqualTo: true).get();
    final data = dataRef.docs;
    for (var docSnapshot in data) {
      _events.putIfAbsent(docSnapshot.data().title, () => docSnapshot.data());
    }
    print(_events);
    notifyListeners();
  }
}
