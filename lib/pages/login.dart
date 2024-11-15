import 'package:firstapp/home.dart';
import 'package:flutter/material.dart';
import 'package:firstapp/home.dart';  // Import home.dart
import 'register.dart'; // Import your register.dart (the registration page)

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/forgot': (context) => ForgotPasswordPage(),
        '/home': (context) => HomePage(),  // Link to the HomePage from home.dart
        '/register': (context) => RegisterPage(), // Add route for the register page
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final String _dummyEmail = "user@example.com";
  final String _dummyPassword = "password123";

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_emailController.text == _dummyEmail && _passwordController.text == _dummyPassword) {
        // Navigate to HomePage when login is successful using the named route
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Invalid email or password'),
        ));
      }
    }
  }

  // Helper method to build clickable text
  Widget _buildClickableText(String text, BuildContext context, Widget destinationPage) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destinationPage),  // Navigate to the destination page
        );
      },
      child: Text(
        text,
        style: TextStyle(color: Colors.blue),
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(blurRadius: 8, color: Colors.black26)],
                ),
                child: ClipOval(
                  child: Image.network(
                    'lib/assets/logo.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),

              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),

                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'E-Mail Address',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                              return 'Enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),

                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.visibility),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),

                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/forgot');
                            },
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),

                        Row(
                          children: [
                            Checkbox(value: false, onChanged: (bool? value) {}),
                            Text('Remember Me'),
                          ],
                        ),

                        SizedBox(height: 10),

                        // Use _buildClickableText for the registration button
                        _buildClickableText(
                          "LOGIN",
                          context,
                          HomePage(),  //
                        ),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: Image.network(
                              'lib/assets/google.png',
                              width: 24,
                              height: 24,
                            ),
                            label: Text('Login with Google'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),

                        // Use _buildClickableText for the registration button
                        _buildClickableText(
                          "Don't have an account? Create One",
                          context,
                          RegisterPage(),  // Navigate to RegisterPage
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Forgot Password")),
      body: Center(
        child: Text(
          "Enter your email to reset your password",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}