import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screen/logohome.dart';
import 'screen/HomePage.dart';
import 'screen/References.dart';
import 'screen/Experience.dart';
import 'screen/Education.dart';
import 'screen/MyTemplates.dart';
import 'screen/PersonalDetails.dart';
import 'screen/SelectResume.dart';
import 'screen/Skills.dart';
import 'screen/registration/sigup.dart';
import 'screen/registration/login.dart';
import 'screen/registration/forgotpassword.dart';
// import 'screen/References.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Resume Building Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(),
      // educations: MyEducationPage(),
      // experience: MyExperiencePage(),
      // templates: MyTemplatesPage(),
      // personal: MyPersonalPage(),
      // reference: MyReferencePage(),
      // resume: MyResumePage(),
      // skill: MySkillPage(),
      initialRoute: '/',
      routes: {
        '/': (context) => const MylogohomePage(),
        '/Home': (context) => const MyHomePage(),
        '/education': (context) => const MyEducationPage(),
        '/experience': (context) => const MyExperiencePage(),
        '/templates': (context) => const MyTemplatesPage(),
        '/personal': (context) => const MyPersonalPage(),
        '/reference': (context) => const MyReferencePage(),
        '/resume': (context) => const MyResumePage(),
        '/skill': (context) => const MySkillPage(),
        '/signup': (context) => const MySignupPage(),
        '/login': (context) => const MyLoginPage(),
        '/forgotpassword': (context) => const MyForgotPage(),
      },
    );
  }
}
