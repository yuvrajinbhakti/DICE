import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class EventApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DICE Events',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: EventScreen(),
    );
  }
}

class EventScreen extends StatelessWidget {
  final List<Event> pastEvents = [
    Event('Event 1', DateTime(2023, 7, 10)),
    Event('Event 2', DateTime(2023, 7, 12)),
    Event('Event 3', DateTime(2023, 7, 15)),
    Event('Event 4', DateTime(2023, 7, 20)),
    Event('Event 5', DateTime(2023, 7, 25)),
  ];

  final List<Event> upcomingEvents = [
    Event('Event 6', DateTime(2023, 8, 5)),
    Event('Event 7', DateTime(2023, 8, 10)),
    Event('Event 8', DateTime(2023, 8, 15)),
    Event('Event 9', DateTime(2023, 8, 20)),
    Event('Event 10', DateTime(2023, 8, 25)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DICE Events'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Past Events'),
              _buildEventCarousel(pastEvents, Colors.red.shade100),
              _buildViewAllButton('View All Past Events', () {
                // Add your logic to handle "View All" button tap for past events
              }),
              SizedBox(height: 16.0),
              _buildSectionTitle('Upcoming Events'),
              _buildEventCarousel(upcomingEvents, Colors.red.shade200),
              _buildViewAllButton('View All Upcoming Events', () {
                // Add your logic to handle "View All" button tap for upcoming events
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildEventCarousel(List<Event> events, Color color) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.0),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 200.0,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          scrollPhysics: BouncingScrollPhysics(),
        ),
        items: events.map((event) {
          return EventCard(
            title: event.title,
            date: event.date,
            color: color,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildViewAllButton(String buttonText, VoidCallback onPressed) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}


class Event {
  final String title;
  final DateTime date;

  Event(this.title, this.date);
}

class EventCard extends StatelessWidget {
  final String title;
  final DateTime date;
  final Color color;

  EventCard({required this.title, required this.date, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
        title: Text(title),
        subtitle: Text('Date: ${date.toString().substring(0, 10)}'),
      ),
    );
  }
}