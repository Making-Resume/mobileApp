import 'package:flutter/material.dart';
import 'package:resumemaker/models/ApiError.dart';
import 'package:resumemaker/models/UserAuthentication.dart';

import 'package:resumemaker/utils/loginPageAnimation.dart';
import 'package:resumemaker/view/RegisterPage.dart';
import 'package:resumemaker/view/widgets/custom_AlertDialog.dart';
import 'package:resumemaker/view/widgets/custom_Button.dart';
import 'package:resumemaker/view/widgets/custom_textFormField.dart';
import 'package:resumemaker/view/widgets/header.dart';
import 'package:simple_animations/simple_animations.dart';

class Login extends StatefulWidget  {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  TextEditingController _enamilController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  UserAuthenticationRepository user = UserAuthenticationRepository();
  final _formKey = GlobalKey<FormState>();


  double? width = 200.0;
  double? height = 50.0;
  bool? _isLoading = false;
  @override
  void initState() {

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  triggerButton({String? email, String? password}) async {
    setState(() {
      _isLoading = true;
      width = 50;
    });
    //await Future.delayed(Duration(seconds: 4));
    await user.Login(email: email!, password: password!)!.then(
      (value) {
        if (value is User) {
          Navigator.pushNamed(context, '/codeVerification');
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
    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              custom_header(path: 'assets/images/login.json' ,  context: context ),
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
                                  height: 60,
                                  padding: EdgeInsets.only(left: 2),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: (Colors.grey[100])!))),
                                  child: customTextFormfield(
                                      controller: _enamilController,
                                      hintText: "Email",

                                      /// label: 'Family',
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your Email';
                                        }
                                      }),
                                ),
                                Container(
                                  height: 50,
                                  padding: EdgeInsets.only(left: 2),
                                  child: customTextFormfield(
                                      controller: _passwordController,
                                      hintText: "Password",
                                      obscureText: true,

                                      /// label: 'Family',
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your password';
                                        }
                                      }),
                                )
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(
                        2,
                        custom_Button(
                          width: width,
                          height: height,
                          title: 'Login',
                          onTap: () async {
                            //if (_formKey.currentState!.validate()) {
                              // await triggerButton(
                              //     email: _enamilController.text,
                              //     password: _passwordController.text);
                                                              Navigator.pushReplacementNamed(
                                    context, '/codeVerification2');
                          //  }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      FadeAnimation(
                          1.5,
                          InkWell(
                                                    onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, '/forgotPassword');
                              },
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  color: Color.fromRGBO(143, 148, 251, 1)),
                            ),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      FadeAnimation(
                          1.5,
                          InkWell(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, '/registerPage');
                              },
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    fontFamily: 'circular',
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
