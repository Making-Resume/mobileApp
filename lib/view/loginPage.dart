import 'package:any_animated_button/any_animated_button.dart';
import 'package:flutter/material.dart';
import 'package:resumemaker/utils/failure.dart';
import 'package:resumemaker/utils/loginPageAnimation.dart';
import 'package:resumemaker/view/RegisterPage.dart';
import 'package:resumemaker/view/widgets/custom_Button.dart';
import 'package:resumemaker/view/widgets/custom_textFormField.dart';

import '../bloc/registrationPage/button_bloc/error_bloc.dart';
import '../bloc/registrationPage/button_bloc/short_bloc.dart';
import '../bloc/registrationPage/button_bloc/success_bloc.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _enamilController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
 AnimationController? animationController;

  late final SuccessBloc successBloc;
  late final SuccessBloc _success2Bloc;
  late final ErrorBloc _errorBloc;
  late final ShortBloc _shortBloc;
  late final ShortBloc _enabledButton;
  late final ShortBloc _nullWidth;
  late final ShortBloc _infinityWidth;
  late final ShortBloc _fixedWidth;

  bool _enabled = false;


   @override
  void initState() {
    successBloc = SuccessBloc();
    _success2Bloc = SuccessBloc();
    _errorBloc = ErrorBloc();
    _shortBloc = ShortBloc();
    _enabledButton = ShortBloc();
    _nullWidth = ShortBloc();
    _infinityWidth = ShortBloc();
    _fixedWidth = ShortBloc();

    super.initState();
  }

  @override
  void dispose() {
    successBloc.close();
    _success2Bloc.close();
    _errorBloc.close();
    _shortBloc.close();
    _enabledButton.close();
    _nullWidth.close();
    _infinityWidth.close();
    _fixedWidth.close();

    super.dispose();
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
            MinimalisticButton(
              bloc: successBloc as AnyAnimatedButtonBloc<Object, Object, Object>?, 
              text: 'Animated success button',
              onTap: () => successBloc.add(TriggerAnyAnimatedButtonEvent(13)),
),
                        ),
                    SizedBox(
                      height: 25,
                    ),
                    FadeAnimation(
                        1.5,
                        Text(
                          "Forgot Password?",
                          style:
                              TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
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
