import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Auth {
  static Future<User?> SignIn({
    required String email,
    required String password,
  }) async {
    User? user;
    try {
      UserCredential credential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = credential.user;
      print('you are logged in');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email');
      } else if (e.code == 'wrong-password') {
        print('Wrong password');
      }
    }
    print(user);
    return user;
    // print(user);
  }

  static Future<void> LogOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  static String? GetAuthUser() {
    String? coba;
    try {
      if (FirebaseAuth.instance.currentUser != null) {
        coba = 'User: ${FirebaseAuth.instance.currentUser?.uid}';
      }
    } on FirebaseAuthException catch (e) {
      coba = e.code;
    }
    return coba;
  }
}
