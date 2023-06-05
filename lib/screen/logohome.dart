import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tms/screen/registration/login.dart';
import 'package:tms/widgets/constant.dart';
import '../screen/registration/login.dart';

class MylogohomePage extends StatefulWidget {
  const MylogohomePage({super.key});

  @override
  State<MylogohomePage> createState() => _MylogohomePageState();
}

class _MylogohomePageState extends State<MylogohomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Center(
        child: GestureDetector(
          onTap: () {
            // Navigate to the HomePage
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyLoginPage()),
            );
          },
          child: Image.asset(
            'assets/images/logo.jpeg', // Replace with your logo image path
            width: 150,
            height: 150,
          ),
        ),
      ),
    );
  }
}

AppBar _buildAppBar() {
  return AppBar(
    backgroundColor: Colors.blue,
    elevation: 0,
  );
}
