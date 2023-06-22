import 'package:flutter/material.dart';
import 'package:resumemaker/view/loginPage.dart';
import 'package:resumemaker/view/codeVerification.dart';
import 'package:resumemaker/view/mainRegistration.dart';
import 'package:sms_autofill/sms_autofill.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'resumeMaker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),

      initialRoute: '/loginPage',
      routes: {
       // '/': (context) => HomeScreen(),
        '/loginPage': (context) => Login(),
        '/codeVerification' :(context) => codeVerification(),
        '/registrationPage' : (context) => RegistrationPage(),
      },
    );
  }
}

