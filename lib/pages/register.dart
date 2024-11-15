import 'package:flutter/material.dart';
import 'login.dart'; // Import the LoginPage

// Simulated user storage (You can replace this with local storage or database later)
List<Map<String, String>> users = [];

void main() {
  runApp(RegisterPage());
}

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => LoginPage(), // Define the route to the login page
      },
      home: Scaffold(
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
        body: RegisterForm(),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _agree = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Brand/logo section
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.network(
                    'lib/assets/logo.jpg', // Put your logo image here
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 40),

              // Register Form
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Name Field
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "What's your name?";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),

                        // Email Field
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'E-Mail Address',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty || !RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$").hasMatch(value)) {
                              return "Your email is invalid";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),

                        // Password Field
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password is required';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),

                        // Terms & Conditions Checkbox
                        Row(
                          children: [
                            Checkbox(
                              value: _agree,
                              onChanged: (bool? value) {
                                setState(() {
                                  _agree = value!;
                                });
                              },
                            ),
                            Expanded(
                              child: Text(
                                'I agree to the Terms and Conditions',
                                softWrap: true,
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),

                        // Register Button
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate() && _agree) {
                              // Register user
                              users.add({
                                'name': _nameController.text,
                                'email': _emailController.text,
                                'password': _passwordController.text,
                              });

                              // Show confirmation message
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registration Successful')));
                            } else if (!_agree) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('You must agree to the terms')));
                            }
                          },
                          child: Text('Register'),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Login Link
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login'); // Navigate to Login page
                },
                child: Text('Already have an account? Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
