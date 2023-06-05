import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tms/widgets/constant.dart';
import 'HomePage.dart';

class MyEducationPage extends StatefulWidget {
  const MyEducationPage({super.key});

  @override
  State<MyEducationPage> createState() => _MyEducationPageState();
}

class _MyEducationPageState extends State<MyEducationPage> {
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _institutionController = TextEditingController();
  final TextEditingController _percentageController = TextEditingController();
  final TextEditingController _graduationController = TextEditingController();

  @override
  void dispose() {
    _courseController.dispose();
    _institutionController.dispose();
    _percentageController.dispose();
    _graduationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: _buildColumn(
                'Course/Degree Name',
                'Enter course/degree name',
                _courseController,
              ),
            ),
            Expanded(
              child: _buildColumn(
                'Institution Name',
                'Enter institution name',
                _institutionController,
              ),
            ),
            Expanded(
              child: _buildColumn(
                'Percentage/CGPA',
                'Enter your percentage',
                _percentageController,
              ),
            ),
            Expanded(
              child: _buildColumn(
                'Graduated/Pursuing',
                'Enter your graduation year',
                _graduationController,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
        child: ElevatedButton(
          onPressed: () {
            _printData(); // Call the method to print the entered data
            _resetFields(); // Reset the entered data
          },
          child: const Text('Save'),
        ),
      ),
    );
  }

  Widget _buildColumn(
    String labelText,
    String hintText,
    TextEditingController controller,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            labelText,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        _buildNameRow(labelText, hintText, controller),
      ],
    );
  }

  Widget _buildNameRow(
    String labelText,
    String hintText,
    TextEditingController controller,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(
          fontSize: 10,
        ),
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hintText,
          labelText: labelText,
        ),
        onChanged: (_) {},
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
          Navigator.pop(context); // Navigate back to the previous page
        },
      ),
      title: const Center(
        child: Text(
          'Education',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void _printData() {
    final courseName = _courseController.text;
    final institutionName = _institutionController.text;
    final percentage = _percentageController.text;
    final graduationYear = _graduationController.text;

    print('Course/Degree Name: $courseName');
    print('Institution Name: $institutionName');
    print('Percentage/CGPA: $percentage');
    print('Graduated/Pursuing: $graduationYear');
  }

  void _resetFields() {
    _courseController.clear();
    _institutionController.clear();
    _percentageController.clear();
    _graduationController.clear();
  }
}
