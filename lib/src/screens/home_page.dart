import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


import 'package:notifications_app/src/data_models/general_user.dart';

import '../services/auth_service.dart';

class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();
    getUserToken();
    getUsers();
  }
  @override
  Widget build(BuildContext context)  {
    
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: StreamBuilder<List<GeneralUser>> (stream: getUsers(),
        builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return tokenCard(snapshot.data![index]);
                  });
            }
          },),
      ),
    );
  }

  void getUserToken() {
    _messaging.getToken().then((token) {
      String? userUid =
          Provider.of<AuthProvider>(context, listen: false).uid;
      GeneralUser theGeneralUser = GeneralUser(uid: userUid, token: token!);
      _firestore.collection('users').doc(userUid).set(theGeneralUser.toMap());
      print('uid =======>' + userUid);
      print('token =====>' + token);
    });
  }

  Stream<List<GeneralUser>>? getUsers() {
    return _firestore.collection('users').snapshots().map(
          (docValue) => docValue.docs
              .map(
                (userMap) => GeneralUser.fromMap(
                  userMap.data(),
                ),
              )
              .toList(),
        );
  }
  Widget tokenCard (user) {
    return Card(
      child:  Column(
        children: [
          Text('the uid: ' + user.uid),
          const SizedBox(
            height: 30,
          ),
          Text('the token: ' + user.token),
        ],
      ),
    );
  }
  
}
