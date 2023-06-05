import 'package:flutter/material.dart';
import 'package:tms/widgets/constant.dart';
import './HomePage.dart'; // Import your HomePage.dart file

class MyTemplatesPage extends StatefulWidget {
  const MyTemplatesPage({super.key});

  @override
  State<MyTemplatesPage> createState() => _MyTemplatesPageState();
}

class _MyTemplatesPageState extends State<MyTemplatesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/mytemplate.jpg',
              width: 450,
              height: 450,
            ),
            const SizedBox(height: 20),
            const Text(
              'No Data Found',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

AppBar _buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      icon: const Icon(
        Icons.add,
        color: kBlue,
      ),
      onPressed: () {
        // Navigate to the home page
        _navigateToHomePage(context);
      },
    ),
    title: Center(
      child: Text(
        'My Templates',
        style: TextStyle(
          color: kdark,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

void _navigateToHomePage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const MyHomePage()),
  );
}
