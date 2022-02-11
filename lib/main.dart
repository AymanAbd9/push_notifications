import 'package:flutter/material.dart';
import 'package:notifications_app/app.dart';
import 'package:notifications_app/src/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MultiProvider(
        child:  const AppView(),
        providers: [
          // ChangeNotifierProvider(create: (_) => FirestoreService()),
          ChangeNotifierProvider(create: (_) => AuthProvider()),
        ],
      )
  );
     
}
