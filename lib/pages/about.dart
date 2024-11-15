import 'package:flutter/material.dart';
import 'experience.dart'; // Import your experience page

class AboutPage extends StatelessWidget {
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
            SizedBox(height: 20),
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage('lib/assets/Larios, Jemuel R. .png'),
            ),
            SizedBox(height: 20),
            // Experience Section inside the box
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250, // Width of the container
                  padding: EdgeInsets.all(8), // Padding for the content inside
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.verified, size: 32),
                      SizedBox(height: 8),
                      Text(
                        'Experience\n3+ years\nBSIT Student',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            // Education Section inside the box
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250, // Width of the container
                  padding: EdgeInsets.all(8), // Padding for the content inside
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.school, size: 32),
                      SizedBox(height: 8),
                      Text(
                        'Education\nBachelor of Science in Information Technology',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            // Additional Info text about you
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Welcome to my web developer portfolio! I\'m Jemuel R. Larios, 20 years old, BS Information Technology Set C, Third Year Student, and I\'m currently living in Prk. Pag-asa Seminary Drive, Brgy Magugpo West, Tagum City, Davao Del Norte. My hobbies are Reading manhwa, manga, and novels, Watching movies and anime, and playing sports like Soccer.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Inter',
                ),
              ),
            ),
            SizedBox(height: 40),
            // Final Explore My Experience section (Clickable)
            GestureDetector(
              onTap: () {
                // Navigate to the Experience page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExperiencePage()),
                );
              },
              child: Column(
                children: [
                  Text(
                    'Explore My',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Inter',
                    ),
                  ),
                  Text(
                    'Experience',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Inter',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
