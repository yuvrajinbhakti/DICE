import 'package:dice2/screens/aboutus.dart';
import 'package:dice2/screens/forgot_password.dart';
import 'package:dice2/screens/home_page.dart';

import 'package:dice2/screens/login_page.dart';
import 'package:dice2/screens/pastevents.dart';
import 'package:dice2/screens/signup.dart';
import 'package:dice2/screens/splash_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SplashScreen(), // Use SplashScreen as the initial route
      routes: {
        '/home': (context) => const HomePage(),
        '/login':(context)=> const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/forgotPassword': (context) => ForgotPasswordPage(),
        '/aboutus': (context) => AboutUsPage(),
        '/pastevents': (context) => PastEventsPage(),
      },
    );
  }
}
