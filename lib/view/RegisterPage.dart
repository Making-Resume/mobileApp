import 'package:flutter/material.dart';
import 'package:resumemaker/utils/loginPageAnimation.dart';
import 'package:resumemaker/view/loginPage.dart';
import 'package:resumemaker/view/widgets/custom_Button.dart';
import 'package:resumemaker/view/widgets/custom_textFormField.dart';

import '../models/UserAuthentication.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

    UserAuthenticationRepository user = UserAuthenticationRepository();

  double? width = 200.0;
  double? height = 50.0;
  bool? _isLoading = false;

  
  void triggerButton() async {
    setState(() {
      _isLoading = true;
      width = 50;
    });
   await Future.delayed(Duration(seconds: 4));
    user.Register(email: 'MohsenKashefi2016@yahooc.com')!.then((value) {
           if(value is User){
            Navigator.pushNamed(context, '/codeVerification');
           }
    },);

    setState(() {
       width = 200;
      _isLoading = false;
    });
  }
  TextEditingController emailController =  TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
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
                                  image:
                                      AssetImage('assets/images/light-1.png'))),
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
                                  image:
                                      AssetImage('assets/images/light-2.png'))),
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
                              "Register",
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
                              height: 50,
                            //  padding: EdgeInsets.all(2.0),
                              // decoration: BoxDecoration(
                              //     border: Border(
                              //         bottom: BorderSide(
                              //             color: (Colors.grey[100])!)
                              //             )
                              //             ),
                              child: customTextFormfield(
                                  controller: emailController,
                                  hintText: "Email",

                                  /// label: 'Family',
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your email';
                                    }
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

                            child: width! == 50  ? Center(child: CircularProgressIndicator(color: Colors.white,)) :Center(child: Text('Register')) ,
                            width: width,
                            height: height,


                            duration: Duration(seconds: 1))
                      ),
                    ),
              
            
            
                  SizedBox(
                    height: 30,
                  ),
                  FadeAnimation(
                      1.5,
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Color.fromRGBO(143, 148, 251, 1)),
                          ))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
