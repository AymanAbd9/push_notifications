import 'package:flutter/material.dart';
import 'package:notifications_app/src/home_page.dart';
import 'package:notifications_app/src/screens/register_screen.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'attendance app',
      home: HomePage(),

      
    );
  }
}
