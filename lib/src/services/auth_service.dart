import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String uid = '';

  setUid(theUid) {
    uid = theUid;
  }

  Future<void> signInAnonymously() async {
    UserCredential userCredential = await _firebaseAuth.signInAnonymously();

    setUid(userCredential.user!.uid);

    _firestore.collection('users').doc(uid);
    // _firestore.collection('users').doc(uid).set({
    //   'uid' : this.uid
    // });
  }

  // Future<void> addtheUserToTheDatabase(GeneralUser gUser) async {
  //   await _firestore
  //       .collection('users')
  //       .doc(gUser.uid)
  //       .set(gUser.toMap(), SetOptions(merge: true));

  //   setTheGUser(gUser);
  // }

}
