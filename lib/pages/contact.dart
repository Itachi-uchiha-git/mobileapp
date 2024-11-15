import 'package:firstapp/pages/about.dart';
import 'package:firstapp/pages/experience.dart';
import 'package:firstapp/pages/projects.dart';
import 'package:flutter/material.dart';
import 'about.dart';
import 'experience.dart';
import 'projects.dart';
import 'contact.dart';   // Import the Contact Page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContactPage(),
    );
  }
}

class ContactPage extends StatelessWidget {
  // Method to make text clickable and navigate to the respective page
  Widget _buildClickableText(String text, BuildContext context, Widget page) {
    return GestureDetector(
      onTap: () {
        // Navigate to the respective page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Text(
        text,
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w900,
          fontFamily: 'Inter',
          color: Colors.black, // Text color
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          '9:41',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
            fontFamily: 'SF Pro Text',
            letterSpacing: -0.3,
          ),
        ),
        centerTitle: true,
        actions: [
          Row(
            children: [
              Icon(Icons.signal_cellular_alt, color: Colors.white),
              SizedBox(width: 5),
              Icon(Icons.wifi, color: Colors.white),
              SizedBox(width: 5),
              Icon(Icons.battery_full, color: Colors.white),
              SizedBox(width: 10),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Text(
              'Get in Touch',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                fontFamily: 'Inter',
              ),
            ),
            Text(
              'Contact Me',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w900,
                fontFamily: 'Inter',
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.email, size: 30),
                      SizedBox(width: 10),
                      Text(
                        'Larios.jemuel@dnsc.edu.ph',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.facebook, size: 28),
                      SizedBox(width: 10),
                      Text(
                        'Facebook',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            // Make these texts clickable
            Column(
              children: [
                _buildClickableText('About', context, AboutPage()),
                SizedBox(height: 20),
                _buildClickableText('Experience', context, ExperiencePage()),
                SizedBox(height: 20),
                _buildClickableText('Projects', context, ProjectsPage()),
                SizedBox(height: 20),
                _buildClickableText('Contact', context, ContactPage()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
