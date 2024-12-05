import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'views/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //home: const Home(), // Tela inicial
      debugShowCheckedModeBanner: false,
      home: Login(),
      routes: {},
    );
  }
}
