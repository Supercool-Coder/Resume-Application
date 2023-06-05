import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tms/widgets/constant.dart';

class MyResumePage extends StatefulWidget {
  const MyResumePage({super.key});

  @override
  State<MyResumePage> createState() => _MyResumePageState();
}

class _MyResumePageState extends State<MyResumePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
    );
  }
}

AppBar _buildAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: kBlue,
      ),
      onPressed: () {},
    ),
    title: Stack(
      children: [
        Center(
          child: Text(
            'Select Resume',
            style: TextStyle(
              color: kdark,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}
