import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resumemaker/bloc/registrationPage/registrationPage._state.dart';
import 'package:resumemaker/utils/const/textStyle.dart';
import 'package:resumemaker/utils/loginPageAnimation.dart';
import 'package:resumemaker/view/widgets/custom_Button.dart';
import 'package:resumemaker/view/widgets/custom_textFormField.dart';
import 'package:resumemaker/view/widgets/header.dart';
import 'package:resumemaker/view/widgets/scaffoldMessenger.dart';

import '../bloc/registrationPage/registrationPage_bloc.dart';
import '../bloc/registrationPage/registrationPage_event.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
  double? width = 200.0;
  double? height = 50.0;
  bool? _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegistrationBloc, RegistrationState>(
        listener: (context, state) {
          if (state is RegistrationSuccess) {
            width = state.width;
            show_message(message: 'Registration Successful!', context: context);
          } else if (state is RegistrationFailure) {
            width = state.width;
            // Handle registration failure
            show_message(
                message: 'Registration Failed. Please try again.',
                context: context);
          } else if (state is RegistrationLoading) {
            width = state.width;
          }
        },
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                custom_header(
                    path: 'assets/images/register.json', context: context , height: 400 , width: 400),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Form(
                    key: _formKey,
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
                                        color:
                                            Color.fromRGBO(143, 148, 251, .2),
                                        blurRadius: 20.0,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    height: 55,
                                    padding: EdgeInsets.only(left: 5),
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
                                    height: 55,
                                    padding: EdgeInsets.only(left: 5),
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
                                    height: 50,
                                    padding: EdgeInsets.only(left: 5),
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
                        BlocBuilder<RegistrationBloc, RegistrationState>(
                          builder: (context, state) {
                            if (state is RegistrationLoading) {
                              width = 50;
                            } else if (state is RegistrationSuccess) {
                              width = 200;
                            } else if (state is RegistrationFailure) {
                              width = 200;
                            }
                            return FadeAnimation(
                              1.5,
                              custom_Button(
                                  width: width,
                                  height: height,
                                  title: 'submit',
                                  onTap: state is RegistrationLoading
                                      ? null
                                      : () async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            BlocProvider.of<RegistrationBloc>(
                                                    context)
                                                .add(
                                              RegisterButtonPressed(
                                                name: nameController.text,
                                                family: familyController.text,
                                                password:
                                                    passwordController.text,
                                              ),
                                            );
                                          }
                                        }),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
