
 import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:math';

class Event {
  final String eventName;
  final String details;
  final List<String> photoUrls;

  Event({required this.eventName, required this.details, required this.photoUrls});
}

class PastEventsPage extends StatelessWidget {
  final List<Event> events = List.generate(10, (index) => _generateRandomEvent());

  static Event _generateRandomEvent() {
    // List of random event names and details related to computer science projects and seminars
    final eventNames = [
      "TechFest 2023",
      "CodeCamp Seminar",
      "AI Showcase",
      "Hackathon 2.0",
      "Web Development Workshop",
      "Big Data Conference",
      "Cybersecurity Summit",
      "Mobile App Expo",
      "Robotics Exhibition",
      "Blockchain Symposium",
    ];

    final random = Random();

    return Event(
      eventName: eventNames[random.nextInt(eventNames.length)],
      details: _generateRandomEventDetails(),
      photoUrls: [], // Add image URLs here when you have them
    );
  }

  static String _generateRandomEventDetails() {
    final eventDetails = [
      "Join us for an exciting showcase of cutting-edge technology and innovation. Don't miss the chance to network with industry experts!",
      "CodeCamp Seminar brings together developers from all backgrounds to share knowledge and exchange ideas.",
      "Discover the latest advancements in Artificial Intelligence and its applications in various industries.",
      "Gear up for a high-energy hackathon where you can collaborate, create, and compete to win amazing prizes.",
      "Learn how to build modern and responsive websites in this hands-on web development workshop.",
      "Explore the world of big data and analytics with industry leaders and data scientists.",
      "Enhance your understanding of cybersecurity threats and solutions in this comprehensive summit.",
      "Get a sneak peek into the future of mobile apps and explore the possibilities with leading developers.",
      "Witness the marvels of robotics and automation in this captivating exhibition.",
      "Learn about the revolutionary technology of blockchain and its potential to transform industries.",
    ];

    final random = Random();
    return eventDetails[random.nextInt(eventDetails.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Past Events'),
        backgroundColor: Colors.red, // Change the app bar color to red
      ),
      body: Center(
        child: ListView.builder(
          itemCount: events.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      events[index].eventName,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 200.0,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                      ),
                      items: events[index].photoUrls
                          .map(
                            (photoUrl) => Container(
                              child: Image.network(
                                photoUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    SizedBox(height: 8),
                    Text(
                      events[index].details,
                      textAlign: TextAlign.center,
                    ),
                    Divider(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context); // Go back to the main page when the button is pressed
        },
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.red, // Change the button color to red
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Event App',
    home: PastEventsPage(),
  ));
}

