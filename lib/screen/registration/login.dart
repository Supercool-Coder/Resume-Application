import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './sigup.dart';
import './forgotpassword.dart';
import '../MyTemplates.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late BuildContext _scaffoldContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Builder(
        builder: (BuildContext context) {
          _scaffoldContext = context;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Image.asset(
                  'assets/images/logo.jpeg',
                  height: 100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _buildColumn('Email', _emailController),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _buildColumn('Password', _passwordController),
              ),
              _buildForgotPasswordLink(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  // Handle login button press
                  String email = _emailController.text;
                  String password = _passwordController.text;

                  if (email.isEmpty || password.isEmpty) {
                    // Show an error message if any of the fields are empty
                    ScaffoldMessenger.of(_scaffoldContext).showSnackBar(
                      const SnackBar(
                        content: Text('Please fill in all fields'),
                      ),
                    );
                    return;
                  }

                  // Make a POST request to the login API
                  Uri url = Uri.parse(
                      'http://127.0.0.1:8000/api/user/signin/'); // Replace with your actual login API URL
                  Map<String, String> headers = {
                    'Content-Type': 'application/json'
                  };
                  Map<String, String> body = {
                    'email': email,
                    'password': password
                  };

                  http.Response response = await http.post(
                    url,
                    headers: headers,
                    body: jsonEncode(body),
                  );

                  if (response.statusCode == 200) {
                    // Login successful, handle the response
                    print('Login successful');

                    // Check if user is registered
                    bool isRegistered =
                        jsonDecode(response.body)['is_registered'];

                    if (isRegistered) {
                      // Navigate to the MyTemplatesPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyTemplatesPage(),
                        ),
                      );
                    } else {
                      // Display an error message to the user
                      ScaffoldMessenger.of(_scaffoldContext).showSnackBar(
                        const SnackBar(
                          content:
                              Text('Please sign up, you are not registered'),
                          duration: Duration(seconds: 5),
                        ),
                      );
                    }
                  } else if (response.statusCode == 404) {
                    // User not registered, display alert
                    _showRegistrationAlert();
                  } else {
                    // Login failed, handle the error
                    print('Login failed');
                    // Display an error message to the user
                    ScaffoldMessenger.of(_scaffoldContext).showSnackBar(
                      const SnackBar(
                        content: Text('Invalid email or password'),
                      ),
                    );
                  }
                },
                child: const Text('Login'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the Signup page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MySignupPage(),
                    ),
                  );
                },
                child: const Text('Signup'),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildColumn(String labelText, TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          TextFormField(
            controller: controller,
            style: const TextStyle(fontSize: 16),
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: labelText,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid $labelText';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildForgotPasswordLink() {
    return Container(
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextButton(
        onPressed: () {
          // Handle forgot password link press
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyForgotPage()),
          );
        },
        child: const Text(
          'Forgot Password?',
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.blue,
        ),
        onPressed: () {
          // Navigate back to the signup page
          Navigator.pop(context);
        },
      ),
    );
  }

  void _showRegistrationAlert() {
    ScaffoldMessenger.of(_scaffoldContext).showSnackBar(
      const SnackBar(
        content: Text('Please sign up, you are not registered'),
        duration: Duration(seconds: 5),
      ),
    );
  }
}
