import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tms/widgets/constant.dart';
import './HomePage.dart';

class MyExperiencePage extends StatefulWidget {
  const MyExperiencePage({super.key});

  @override
  State<MyExperiencePage> createState() => _MyExperiencePageState();
}

class _MyExperiencePageState extends State<MyExperiencePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildColumn('Experience', 'Enter your experience'),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
        child: ElevatedButton(
          onPressed: () {
            // Handle save button press
          },
          child: const Text('Save'),
        ),
      ),
    );
  }

  Widget _buildColumn(String labelText, String hintText) {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              labelText,
              style: TextStyle(
                color: kdark,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildNameRow('', labelText, hintText),
        ],
      ),
    );
  }

  Widget _buildNameRow(String name, String labelText, String hintText) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        initialValue: name,
        style: const TextStyle(
          fontSize: 10,
        ),
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hintText,
          labelText: labelText,
        ),
        onChanged: (value) {
          // Handle the updated name value here
        },
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
          color: kBlue,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyHomePage()),
          );
        },
      ),
      title: Stack(
        children: [
          Center(
            child: Text(
              'Experience',
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
}
