import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tms/widgets/constant.dart';
import 'HomePage.dart';

class MySkillPage extends StatefulWidget {
  const MySkillPage({Key? key}) : super(key: key);

  @override
  State<MySkillPage> createState() => _MySkillPageState();
}

class _MySkillPageState extends State<MySkillPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              flex: 1,
              child: _buildColumn('Skills', 'Enter your skills'),
            ),
            const SizedBox(width: 60),
            Expanded(
              flex: 1,
              child: _buildColumn('Percentage', 'percentage'),
            ),
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
    return Column(
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
              'Skills',
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
