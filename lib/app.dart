import 'package:flutter/material.dart';
import 'package:notifications_app/src/screens/home_page.dart';
import 'package:notifications_app/src/screens/start_screen.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'attendance app',
      home: StartScreenView(),

      
    );
  }
}
