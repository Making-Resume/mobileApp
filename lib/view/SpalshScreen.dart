import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:resumemaker/bloc/splashScreen/splashScreen_event.dart';

import '../bloc/splashScreen/splashScreen_bloc.dart';
import '../bloc/splashScreen/splashScreen_state.dart';


class splash_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  BlocProvider(
        create: (context) => SplashBloc(),
        child: SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     context.read<SplashBloc>().add(SplashStarted());
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        // Navigate when state is SplashComplete
        if (state is SplashComplete) {
          Navigator.pushNamed(context, '/loginPage');
        }
      },
      child: Scaffold(
        backgroundColor: Color.fromRGBO(143, 148, 251, 1),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  "AN EASY WAY FOR MAKING RESUME",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 50, top: 20),
                height: 400,
                width: 400,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Lottie.asset("assets/images/resume.json"),

                  //      Image.asset('assets/images/login.gif' ,
                  // ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
