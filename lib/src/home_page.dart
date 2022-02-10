import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './services/auth_service.dart';
import './services/firestore_service.dart';

class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    signIn(context);
  }
  @override
  Widget build(BuildContext context)  {
    // String uid = await Provider.of<AuthProvider>(context).signIn();
    
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
      ),
    );
  }

  signIn(context) async {
    Provider.of<AuthProvider>(context, listen: false).signInAnonymously();
  }
}
