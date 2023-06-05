import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class MyForgotPage extends StatefulWidget {
  const MyForgotPage({super.key});

  @override
  State<MyForgotPage> createState() => _MyForgotPageState();
}

class _MyForgotPageState extends State<MyForgotPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  bool _showOtpBox = false; // Track whether to show the OTP box or not

  @override
  void dispose() {
    _emailController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _buildColumn('Email', _emailController),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Handle forgot password button press
              String email = _emailController.text;
              // Call the "Forgot Password" API
              _callForgotPasswordAPI(email);
            },
            child: const Text('Forgot Password'),
          ),
          if (_showOtpBox) // Show the OTP box if _showOtpBox is true
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildColumn('OTP', _otpController),
            ),
        ],
      ),
    );
  }

  Widget _buildColumn(String labelText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
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
            ),
          ],
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
          Navigator.pop(context);
        },
      ),
    );
  }

  void _callForgotPasswordAPI(String email) async {
    // Make a POST request to the "Forgot Password" API
    Uri url = Uri.parse(
        'http://127.0.0.1:8000/api/user/forget-password-otp/'); // Replace with your actual "Forgot Password" API URL
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    Map<String, String> body = {
      'medium': 'email',
      'email': email,
    };

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        // Password reset email sent successfully
        print('Password reset email sent');
        setState(() {
          _showOtpBox = true; // Show the OTP box
        });
      } else {
        // Error occurred while calling the API
        print('Error: ${response.reasonPhrase}');
      }
    } catch (error) {
      // Error occurred during the API call
      print('Error: $error');
    }
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: MyForgotPage(),
    ),
  );
}
