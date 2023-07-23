
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // Initialize the FirebaseAuth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Method to handle user registration using Firebase Authentication
  Future<void> _signUp() async {
    try {
      // Call the createUserWithEmailAndPassword method to register the user
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,  // Get the email from the text field
        password: _passwordController.text,  // Get the password from the text field
      );

      // Check if the userCredential contains a non-null User object, which means registration was successful
      if (userCredential.user != null) {
        // If registration is successful, navigate to the home page
        Navigator.pushReplacementNamed(context, '/login');
      } else {
        // Handle registration failure (if the userCredential.user is null)
        // You can show an error message to the user or handle the failure in any other way
        print('Registration failed');
      }
    } catch (e) {
      // Handle registration error (if any error occurs during registration)
      // You can show an error message to the user or handle the error in any other way
      print('Registration Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink[200]!, Colors.pink[800]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/logo.jpeg', width: 100),
            SizedBox(height: 20),
            // Add your sign-up form fields here
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
              onPressed: _signUp, // Call the _signUp method for user registration
              style: ElevatedButton.styleFrom(
                primary: Colors.pink[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text('Sign Up', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
