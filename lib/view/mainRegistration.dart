import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resumemaker/bloc/registrationPage/registrationPage._state.dart';
import 'package:resumemaker/view/widgets/custom_Button.dart';
import 'package:resumemaker/view/widgets/custom_textFormField.dart';

import '../bloc/registrationPage/registrationPage_bloc.dart';
import '../bloc/registrationPage/registrationPage_event.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 234, 166, 241),
        title: Text('Registration Page' ,style: TextStyle(fontWeight: FontWeight.bold),),
      ),
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
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              customTextFormfield(
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
              SizedBox(height: 10.0),
              customTextFormfield(
                  controller: familyController,
                  hintText: 'Family',
                  label: 'Family',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your family name';
                    }
                  }),
              SizedBox(height: 10.0),
              customTextFormfield(
                  controller: passwordController,
                  hintText: 'Password',
                  label: 'Password',
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password';
                    }
                  }),
              SizedBox(height: 20.0),
               AnimatedRegisterButton(),
              // ElevatedButton(
              //   onPressed: () {
              //     if (_formKey.currentState!.validate()) {
              //       final name = nameController.text;
              //       final family = familyController.text;
              //       final password = passwordController.text;

              //       BlocProvider.of<RegistrationBloc>(context).add(
              //         RegisterButtonPressed(
              //           name: name,
              //           family: family,
              //           password: password,
              //         ),
              //       );
              //     }
              //   },
              //   child: Text('Register'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
