import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signInAnonymously () async {
    UserCredential userCredential = await _firebaseAuth.signInAnonymously();
    String uid = _firebaseAuth.currentUser!.uid;
    _firestore.collection('users').doc(uid).set({
      'uid' : uid
    });
  }

  // Future<String> signIn() async {
  //   UserCredential userCredential = await _firebaseAuth.signInAnonymously();
  //   String uid = _firebaseAuth.currentUser!.uid;
  //   return uid;
  // }


}