import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class MyFireBase {
  final _fireAuth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;

  Future<UserCredential> signUpWithEmailPassword({
    required String email,
    required String password,
    String? userName,
  }) async {
    final userCred = await _fireAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await _fireAuth.currentUser?.updateDisplayName(userName);
    return userCred;
  }

  Future<void> storeUserInfo({String? name, String? dateofBirth}) async {
    if (name != null && dateofBirth != null) {
      await _fireStore.collection('users').add({
        'name': name,
        'dateofBirth': dateofBirth,
      });
    }
  }

  Future<void> signOutUser() async {
    try {
      await _fireAuth.signOut();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
