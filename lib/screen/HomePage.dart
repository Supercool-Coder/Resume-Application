import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tms/widgets/constant.dart';
import 'PersonalDetails.dart';
import 'Education.dart';
import 'References.dart';
import 'Experience.dart';
import 'Skills.dart';
import 'MyTemplates.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: const SafeArea(
        child: HomeScreen(),
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
        Icons.arrow_back,
        color: kBlue,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyTemplatesPage()),
        );
      },
    ),
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // const SizedBox(height: 100),
        Center(
          child: Image.asset(
            'assets/images/home.jpeg',
            height: 200,
            width: 1200,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildBox(
              "Personal Details",
              "assets/images/user.png",
              () {
                // Navigate to the PersonalDetails page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyPersonalPage(),
                  ),
                );
              },
            ),
            _buildBox("Education", "assets/images/education.png", () {
              // Navigate to the Education page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyEducationPage(),
                ),
              );
            }),
            // _buildBox(),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildBox("References", "assets/images/references.png", () {
              // Navigate to the Reference page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyReferencePage(),
                ),
              );
            }),
            _buildBox("Experiences", "assets/images/experiences.png", () {
              // Navigate to the Experiences page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyExperiencePage(),
                ),
              );
            }),
            // _buildBox(),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildBox("Objective", "assets/images/objective.png", () {
              // Navigate to the Education page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyEducationPage(),
                ),
              );
            }),
            _buildBox("Skills", "assets/images/skills.png", () {
              // Navigate to the Skills page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MySkillPage(),
                ),
              );
            }),
            // _buildBox(),
          ],
        ),
        const Spacer(), // This will push the button to the bottom of the screen
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
          child: ElevatedButton(
            onPressed: () {
              // Handle button press
            },
            child: const Text('Next'),
          ),
        ),
      ],
    );
  }
}

Widget _buildBox(String text, String imagePath, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 50,
            height: 50,
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    ),
  );
}

void main() {
  runApp(const MaterialApp(
    home: MyHomePage(),
  ));
}
