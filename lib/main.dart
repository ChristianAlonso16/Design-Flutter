import 'package:cash_app/firebase_options.dart';
import 'package:cash_app/modules/auth/screen/home.dart';
import 'package:cash_app/modules/auth/screen/login.dart';
import 'package:cash_app/modules/auth/screen/register_account.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
       debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
    '/': (context) => const Login(),
            '/login': (context) => const Login(),
    '/register': (context) => const RegisterAccount(),
    '/home':(context) => const Home(),
      },
    );
  }
}
