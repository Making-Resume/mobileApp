import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resumemaker/view/ForgotPassword.dart';
import 'package:resumemaker/view/RegisterPage.dart';
import 'package:resumemaker/view/categoryPage.dart';
import 'package:resumemaker/view/codeVerification2.dart';
import 'package:resumemaker/view/completingTheForm.dart';
import 'package:resumemaker/view/homePage.dart';
import 'package:resumemaker/view/loginPage.dart';
import 'package:resumemaker/view/codeVerification.dart';
import 'package:resumemaker/view/mainRegistration.dart';
import 'package:resumemaker/view/signInWithLinkedIn.dart';
import 'package:resumemaker/view/template_type.dart';
import 'package:showcaseview/showcaseview.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'resumeMaker',
      theme: ThemeData(
        fontFamily: 'circular',
        primarySwatch: Colors.blue,
      ),
      //home: Login(),

     initialRoute: '/signInWithlinkedIN',
      routes: {
     // '/': (context) => ,
        '/loginPage': (context) => Login(),
        '/registerPage' : (context) => Register(),
        '/codeVerification' :(context) => codeVerification(),
        '/registrationPage' : (context) => RegistrationPage(),
        '/codeVerification2':(context) =>  PinCodeVerificationScreen(),
        '/forgotPassword' : (context)=> forgotPassword(),
        '/homePage' : (context) => home_page(),
        '/categoryPage' : (context) => CategoryPage(),
        '/template_type' : (context) =>  Template_Type(),
        '/completingForm' : (context) => UserForm(),
         '/signInWithlinkedIN' : (context) => signInWithLinkedIn(),
      //    Scaffold(
      //   body: ShowCaseWidget(
      //     onStart: (index, key) {
      //       log('onStart: $index, $key');
      //     },
      //     onComplete: (index, key) {
      //       log('onComplete: $index, $key');
      //       if (index == 4) {
      //         SystemChrome.setSystemUIOverlayStyle(
      //           SystemUiOverlayStyle.light.copyWith(
      //             statusBarIconBrightness: Brightness.dark,
      //             statusBarColor: Colors.white,
      //           ),
      //         );
      //       }
      //     },
      //     blurValue: 1,
      //     builder: Builder(builder: (context) => const homePage()),
      //     autoPlayDelay: const Duration(seconds: 3),
      //   ),
      // ),
      },
    );
  }
}

