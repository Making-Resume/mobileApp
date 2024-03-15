import 'package:flutter/material.dart';
import 'package:resumemaker/models/ApiError.dart';
import 'package:resumemaker/utils/loginPageAnimation.dart';
import 'package:resumemaker/view/codeVerification2.dart';
import 'package:resumemaker/view/loginPage.dart';
import 'package:resumemaker/view/widgets/custom_AlertDialog.dart';
import 'package:resumemaker/view/widgets/custom_Button.dart';
import 'package:resumemaker/view/widgets/custom_textFormField.dart';
import 'package:resumemaker/view/widgets/header.dart';

import '../models/UserAuthentication.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  UserAuthenticationRepository user = UserAuthenticationRepository();
  final _formKey = GlobalKey<FormState>();

  double? width = 200.0;
  double? height = 50.0;
  bool? _isLoading = false;

  triggerButton({String? email}) async {
    setState(() {
      _isLoading = true;
      width = 50;
    });
    //await Future.delayed(Duration(seconds: 4));
    await user.Register(email: email!)!.then(
      (value) {
        if (value is User) {
          if (value.code != 200) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return RoundedAlertDialog(
                  title: 'Error',
                  message: value.message,
                );
              },
            );
          } else {
            print(user);
          Navigator.pushReplacementNamed(
              context,
              '/codeVerification2',
              arguments: PinCodeVerificationScreen(
                email: email,
              ),
            );
          }
        } else if (value is ApiError) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return RoundedAlertDialog(
                title: 'Error',
                message: value.message,
              );
            },
          );
        }
      },
    );

    setState(() {
      width = 200;
      _isLoading = false;
    });
  }

  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              custom_header(
                  path: 'assets/images/register2.json',
                  context: context,
                  height: 500,
                  width: 500),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
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
                                      color: Color.fromRGBO(143, 148, 251, .2),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(left: 4),
                                  height: 50,
                                  child: customTextFormfield(
                                      controller: emailController,
                                      hintText: "Email",

                                      /// label: 'Family',
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your email';
                                        }
                                        return null;
                                      }),
                                ),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      FadeAnimation(
                        2,
                        custom_Button(
                          width: width,
                          height: height,
                          title: 'Register',
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              await triggerButton(
                                email: emailController.text,
                              );
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      FadeAnimation(
                          1.5,
                          InkWell(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, '/loginPage');
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Color.fromRGBO(143, 148, 251, 1)),
                              ))),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
