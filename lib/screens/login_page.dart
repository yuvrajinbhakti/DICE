import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // Initialize the FirebaseAuth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Method to handle user login using Firebase Authentication
  Future<void> _login() async {
    try {
      // Call the signInWithEmailAndPassword method to authenticate the user
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text, // Get the email from the text field
        password:
            _passwordController.text, // Get the password from the text field
      );

      // Check if the userCredential contains a non-null User object, which means login was successful
      if (userCredential.user != null) {
        // If login is successful, navigate to the home page
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        // Handle login failure (if the userCredential.user is null)
        // You can show an error message to the user or handle the failure in any other way
        print('Login failed');
      }
    } catch (e) {
      // Handle login error (if any error occurs during login)
      // You can show an error message to the user or handle the error in any other way
      print('Login Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[200]!, Colors.blue[800]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/logo.jpeg', width: 100),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login, // Call the _login method for user login
              style: ElevatedButton.styleFrom(
                primary: Colors.blue[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text('Login', style: TextStyle(fontSize: 18)),
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Navigate to the sign-up page when the button is pressed
                Navigator.pushNamed(context, '/signup');
              },
              child: Text('Don\'t have account, Create new account  ',
                  style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () {
                // Navigate to the forgot password page when the button is pressed
                Navigator.pushNamed(context, '/forgotPassword');
              },
              child: Text('Forgot Password?',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
