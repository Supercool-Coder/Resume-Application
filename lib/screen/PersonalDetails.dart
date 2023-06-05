import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tms/widgets/constant.dart';
import 'HomePage.dart';

class MyPersonalPage extends StatefulWidget {
  const MyPersonalPage({super.key});

  @override
  _MyPersonalPageState createState() => _MyPersonalPageState();
}

class _MyPersonalPageState extends State<MyPersonalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 16.0), // Add padding here
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildPhotoField(),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 8.0), // Set vertical spacing
              child: _buildColumn('Full Name', 'Full Name'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 8.0), // Set vertical spacing
              child: _buildColumn('Contact Number', 'Contact Number'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 8.0), // Set vertical spacing
              child: _buildColumn('Email', 'Email'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 8.0), // Set vertical spacing
              child: _buildColumn('Address', 'Address'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 8.0), // Set vertical spacing
              child: _buildColumn('Field', 'Field'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 8.0), // Set vertical spacing
              child: _buildColumn('About Me', 'About Me'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 28.0),
        child: ElevatedButton(
          onPressed: () {
            // Handle save button press
          },
          child: const Text('Save'),
        ),
      ),
    );
  }

  // Rest of the code...

  // Remaining widget definitions...

  Widget _buildPhotoField() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(4),
            color: Colors.white,
            alignment: Alignment.centerLeft,
            child: Text(
              'Upload Photo',
              style: TextStyle(
                color: kdark,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage(
              'assets/default_photo.png'), // Replace with your own image
        ),
      ],
    );
  }

  Widget _buildColumn(String labelText, String hintText) {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              labelText,
              style: TextStyle(
                color: kdark,
                fontSize: 10,
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
      margin: const EdgeInsets.symmetric(vertical: 0),
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
          Navigator.pop(context); // Go back to the previous screen
        },
      ),
      title: Center(
        child: Text(
          'Personal Details',
          style: TextStyle(
            color: kdark,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
