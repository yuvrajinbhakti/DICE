import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  // Method to handle the password reset process
  Future<void> _resetPassword(BuildContext context) async {
    try {
      String email = _emailController.text.trim();
      if (email.isEmpty) {
        // Show an error message if the email field is empty
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Please enter your email."),
          duration: Duration(seconds: 2),
        ));
        return;
      }

      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      // Show a success message and navigate back to the login page
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Password reset email sent."),
        duration: Duration(seconds: 2),
      ));
      Navigator.pop(context);
    } catch (e) {
      // Handle errors that occur during the password reset process
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Password reset failed. Please try again."),
        duration: Duration(seconds: 2),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange[200]!, Colors.orange[800]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/logo.jpeg', width: 100),
            SizedBox(height: 20),
            // Add your forgot password form fields here
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _resetPassword(context), // Call the _resetPassword method for password reset
              style: ElevatedButton.styleFrom(
                primary: Colors.orange[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text('Reset Password', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
