import 'package:flutter/material.dart';
import 'package:notifications_app/src/screens/home_page.dart';
import 'package:notifications_app/src/services/auth_service.dart';
import 'package:provider/provider.dart';

class StartScreenView extends StatelessWidget {
  const StartScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: ElevatedButton(
          child: const Text('Continue'),
          onPressed: () async {
            await Provider.of<AuthProvider>(context, listen: false).signInAnonymously();
            
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => HomePage()));
          },

        ),
      ),
    );
  }
}
