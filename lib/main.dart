import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:travel_planner/screens/home_page.dart';
import 'package:travel_planner/screens/login_page.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const SafeTrailApp());
}

class SafeTrailApp extends StatelessWidget {
  const SafeTrailApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafeTrail',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF007F7F),
        scaffoldBackgroundColor: const Color(0xFFF5F7F7),
        fontFamily: 'sans-serif',
      ),
      home: const LoginPage(),
    );
  }
}