import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resumemaker/bloc/registrationPage/registrationPage._state.dart';
import 'package:resumemaker/utils/loginPageAnimation.dart';
import 'package:resumemaker/view/widgets/custom_Button.dart';
import 'package:resumemaker/view/widgets/custom_textFormField.dart';

import '../bloc/registrationPage/registrationPage_bloc.dart';
import '../bloc/registrationPage/registrationPage_event.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color.fromARGB(255, 234, 166, 241),
      //   title: Text(
      //     'Registration Page',
      //     style: TextStyle(fontWeight: FontWeight.bold),
      //   ),
      // ),
      body: BlocProvider(
        create: (context) => RegistrationBloc(),
        child: RegistrationForm(),
      ),
    );
  }
}

class RegistrationForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController familyController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegistrationBloc, RegistrationState>(
        listener: (context, state) {
          if (state is RegistrationSuccess) {
            // Handle registration success
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Registration Successful!'),
                duration: Duration(seconds: 2),
              ),
            );
          } else if (state is RegistrationFailure) {
            // Handle registration failure
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Registration Failed. Please try again.'),
                duration: Duration(seconds: 2),
              ),
            );
          }
        },
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/background.png'),
                        fit: BoxFit.fill)),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 30,
                      width: 80,
                      height: 200,
                      child: FadeAnimation(
                          1,
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/light-1.png'))),
                          )),
                    ),
                    Positioned(
                      left: 140,
                      width: 80,
                      height: 150,
                      child: FadeAnimation(
                          1.3,
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/light-2.png'))),
                          )),
                    ),
                    Positioned(
                      right: 40,
                      top: 40,
                      width: 80,
                      height: 150,
                      child: FadeAnimation(
                          1.5,
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/clock.png'))),
                          )),
                    ),
                    Positioned(
                      child: FadeAnimation(
                          1.6,
                          Container(
                            margin: EdgeInsets.only(top: 50),
                            child: Center(
                              child: Text(
                                "complete information",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30 ),
                child: Column(
                  children: <Widget>[
                    FadeAnimation(
                        1.8,
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(143, 148, 251, .2),
                                    blurRadius: 20.0,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: (Colors.grey[100])!))),
                                child: customTextFormfield(
                                  controller: nameController,
                                  hintText: 'Name',
                                  label: 'Name',
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your name';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: (Colors.grey[100])!))),
                                child: customTextFormfield(
                                    controller: familyController,
                                    hintText: 'Family',
                                    label: 'Family',
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your family name';
                                      }
                                    }),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: customTextFormfield(
                                    controller: passwordController,
                                    hintText: 'Password',
                                    label: 'Password',
                                    obscureText: true,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter a password';
                                      }
                                    }),
                              )
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: AnimatedButton(
                        text: 'Register',
                        onPressed: () {},
                        width: 200.0,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));

    // child: Padding(
    //   padding: EdgeInsets.all(20.0),
    //   child: Form(
    //     key: _formKey,
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.stretch,
    //       children: <Widget>[
    //         customTextFormfield(
    //           controller: nameController,
    //           hintText: 'Name',
    //           label: 'Name',
    //           validator: (value) {
    //             if (value!.isEmpty) {
    //               return 'Please enter your name';
    //             }
    //             return null;
    //           },
    //         ),
    //         SizedBox(height: 10.0),
    // customTextFormfield(
    //     controller: familyController,
    //     hintText: 'Family',
    //     label: 'Family',
    //     validator: (value) {
    //       if (value!.isEmpty) {
    //         return 'Please enter your family name';
    //       }
    //     }),
    //         SizedBox(height: 10.0),
    //         customTextFormfield(
    //             controller: passwordController,
    //             hintText: 'Password',
    //             label: 'Password',
    //             obscureText: true,
    //             validator: (value) {
    //               if (value!.isEmpty) {
    //                 return 'Please enter a password';
    //               }
    //             }),
    //         SizedBox(height: 20.0),
    //         Center(
    //           child: AnimatedButton(
    //             onPressed: (){

    //             },
    //             width: 200.0,
    //           ),
    //         )
    //         // ElevatedButton(
    //         //   onPressed: () {
    //         //     if (_formKey.currentState!.validate()) {
    //         //       final name = nameController.text;
    //         //       final family = familyController.text;
    //         //       final password = passwordController.text;

    //         //       BlocProvider.of<RegistrationBloc>(context).add(
    //         //         RegisterButtonPressed(
    //         //           name: name,
    //         //           family: family,
    //         //           password: password,
    //         //         ),
    //         //       );
    //         //     }
    //         //   },
    //         //   child: Text('Register'),
    //         // ),
    //       ],
    //     ),
    //   ),
    // ),
  }
}
