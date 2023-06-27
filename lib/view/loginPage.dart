import 'package:flutter/material.dart';
import 'package:resumemaker/models/UserAuthentication.dart';

import 'package:resumemaker/utils/loginPageAnimation.dart';
import 'package:resumemaker/view/RegisterPage.dart';
import 'package:resumemaker/view/widgets/custom_Button.dart';
import 'package:resumemaker/view/widgets/custom_textFormField.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _enamilController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  UserAuthenticationRepository user = UserAuthenticationRepository();

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

  void triggerButton() async {
    setState(() {
      _isLoading = true;
      width = 50;
    });
   await Future.delayed(Duration(seconds: 4));
    // user.Register(email: 'MohsenKashefi2016@yahooc.com')!.then((value) {
    //        if(value is User){
    //         Navigator.pushNamed(context, '/codeVerification');
    //        }
    // },);

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
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
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
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: (Colors.grey[100])!))),
                                child: customTextFormfield(
                                    controller: _enamilController,
                                    hintText: "Email or Phone number",

                                    /// label: 'Family',
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your password';
                                      }
                                    }),
                              ),
                              Container(
                                height: 60,
                                //   padding: EdgeInsets.all(8.0),
                                child: customTextFormfield(
                                    controller: _passwordController,
                                    hintText: "Password",

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
                      InkWell(
                        onTap:
                            triggerButton,
                      

                        child:  AnimatedContainer(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(143, 148, 251, 1),
                                Color.fromRGBO(143, 148, 251, .6),
                              ]),
                            ),

                            child: width! == 50  ? Center(child: CircularProgressIndicator(color: Colors.white,)) :Center(child: Text('Login')) ,
                            width: width,
                            height: height,


                            duration: Duration(seconds: 1))
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    FadeAnimation(
                        1.5,
                        Text(
                          "Forgot Password?",
                          style: TextStyle(
                              color: Color.fromRGBO(143, 148, 251, 1)),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    FadeAnimation(
                        1.5,
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Register()));
                            },
                            child: Text(
                              "Register",
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Color.fromRGBO(143, 148, 251, 1)),
                            ))),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
