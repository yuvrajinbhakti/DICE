import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home_events.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  // Method to handle user sign-out using Firebase Authentication
  void _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacementNamed(context, '/');
    } catch (e) {
      // Handle sign-out error
      print('Sign Out Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      // Add the Drawer widget to the Scaffold
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Drawer Header
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Customize the drawer header as needed
                  Text(
                    'Welcome to the Home Page!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            // Drawer Menu Items
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('About Us'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/aboutus');
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Past Events '),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/pastevents');
              },
            ),

            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Sign Out'),
              onTap: () => _signOut(context), // Call the _signOut method for user sign-out
            ),
            
          ],
        ),
      ),
      body: EventApp(),
    );
  }
}
