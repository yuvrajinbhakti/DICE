
 import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class Member {
  final String name;
  final String position;
  final String photoPath;

  Member(this.name, this.position, this.photoPath);
}

class AboutUsPage extends StatelessWidget {
  final List<Member> members = [
    Member('Head', 'John Doe', 'assets/head.jpg'),
    Member('Dean', 'Jane Smith', 'assets/dean.jpg'),
    Member('Staff Member 1', 'Alice Johnson', 'assets/staff1.jpg'),
    Member('Staff Member 2', 'Bob Williams', 'assets/staff2.jpg'),
    Member('Staff Member 3', 'Eve Davis', 'assets/staff3.jpg'),
    Member('Student Member 1', 'Alex Johnson', 'assets/student.jpg'),
    Member('Student Member 2', 'Emma Wilson', 'assets/student2.jpg'),
  ];

  final List<String> galleryImages = [
    'assets/image_1.png',
    'assets/image_2.png',
    'assets/image_3.png',
    'assets/image_4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        children: [
          _buildAboutDICE(),
          SizedBox(height: 32),
          _buildGallery(),
          SizedBox(height: 32),
          _buildMemberSection(),
          SizedBox(height: 32),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildAboutDICE() {
    return Container(
      child: Column(
        children: [
          Text(
            'About DICE',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'DICE is an organization at Chitkara that helps students create software and hardware-based projects, including IoT projects.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            'We organize hackathons for students to participate in and mentor them to learn new skills.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            'Our mission is to foster creativity, innovation, and collaboration among students.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            'With our guidance, students develop real-world projects that enhance their learning experience.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            'Join us to explore the exciting world of technology and unleash your potential!',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            'Visit our website for more information and upcoming events.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            'Follow us on social media for updates and project showcases.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildGallery() {
    return Column(
      children: [
        Text(
          'Gallery',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        CarouselSlider.builder(
          options: CarouselOptions(
            height: 200,
            autoPlay: true,
            enlargeCenterPage: true,
          ),
          itemCount: galleryImages.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            final image = galleryImages[index];
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildMemberSection() {
    return Column(
      children: [
        Center(
          child: Text(
            'Members',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildMemberCard(members[0]),
            _buildMemberCard(members[1]),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildMemberCard(members[2]),
            _buildMemberCard(members[3]),
            _buildMemberCard(members[4]),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildMemberCard(members[5]),
            _buildMemberCard(members[6]),
          ],
        ),
      ],
    );
  }

  Widget _buildMemberCard(Member member) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(member.photoPath),
        ),
        SizedBox(height: 8),
        Text(
          member.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(member.position),
      ],
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Us',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Icon(
                Icons.location_on,
                size: 20,
                color: Colors.white,
              ),
              SizedBox(width: 8),
              Text(
                '123 Main Street, City, Country',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.email,
                size: 20,
                color: Colors.white,
              ),
              SizedBox(width: 8),
              Text(
                'info@diceorganization.com',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.link,
                size: 20,
                color: Colors.white,
              ),
              SizedBox(width: 8),
              Text(
                'linkedin.com/diceorganization',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DICE',
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.red[900],
        
        scaffoldBackgroundColor: Colors.white,
      ),
      home: AboutUsPage(),
    );
  }
}
