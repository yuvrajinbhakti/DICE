import 'dart:async';
import 'package:flutter/material.dart';
import 'package:dice2/screens/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate a delay before navigating to the login page
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // You can customize the splash screen UI here
      body: Container(
        color:Colors.blue,
        child: Center(
          
          child: Image.asset(
            'assets/images/logo.jpeg', // Replace this with the correct image path
            width: 200, // Adjust the width as needed
            height: 200, // Adjust the height as needed
          ),
        ),
      ),
    );
  }
}
