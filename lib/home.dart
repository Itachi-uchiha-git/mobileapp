import 'package:flutter/material.dart';
import 'pages/about.dart';
import 'pages/experience.dart';
import 'pages/projects.dart';
import 'pages/contact.dart';
import 'pages/login.dart';
import 'pages/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Jemuel.',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w500,
              fontFamily: 'Newsreader',
              letterSpacing: -0.24,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF426B1F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Inter',
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Wrap(
              spacing: 20,
              children: [
                _buildClickableText('About', context, AboutPage()), // Navigate to AboutPage
                _buildClickableText('Experience', context, ExperiencePage()), // Navigate to ExperiencePage
                _buildClickableText('Projects', context, ProjectsPage()), // Navigate to ProjectsPage
                _buildClickableText('Contact', context, ContactPage()), // Navigate to ContactPage
              ],
            ),
            SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage('lib/assets/Larios, Jemuel R. .png'),
            ),
            SizedBox(height: 20),
            Text(
              "Hello, I'm",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                fontFamily: 'Inter',
              ),
            ),
            Text(
              'Jemuel R. Larios',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                fontFamily: 'Inter',
              ),
            ),
            Text(
              '3rd Year Student',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                fontFamily: 'Inter',
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.facebook),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.code),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 40),
            Text(
              'Get to know more',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                fontFamily: 'Inter',
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()), // Navigate to AboutPage
                );
              },
              child: Text(
                'About me',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Inter',
                  color: Colors.black, // Black color for text
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClickableText(String text, BuildContext context, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w900,
          color: Colors.black, // Black color for text
        ),
      ),
    );
  }
}