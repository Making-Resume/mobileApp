import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:resumemaker/models/codeVerficationModel.dart';
import 'package:resumemaker/utils/const/textStyle.dart';
import 'package:resumemaker/view/widgets/custom_AlertDialog.dart';
import 'package:resumemaker/view/widgets/custom_Button.dart';

import '../models/ApiError.dart';
import '../utils/loginPageAnimation.dart';

class PinCodeVerificationScreen extends StatefulWidget {
  const PinCodeVerificationScreen({
    Key? key,
    this.email,
  }) : super(key: key);

  final String? email;

  @override
  State<PinCodeVerificationScreen> createState() =>
      _PinCodeVerificationScreenState();
}

class _PinCodeVerificationScreenState extends State<PinCodeVerificationScreen> {
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;
  verificatioRepository veriying = verificatioRepository();
  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();
  int? current_code;

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  double? width = 200.0;
  double? height = 50.0;
  bool _isLoading = false;
  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  triggerButton({int? verifying_code}) async {
    setState(() {
      _isLoading = true;
      width = 50;
    });
    await Future.delayed(Duration(seconds: 4));
    await veriying
        .sendCode(email: widget.email!, verification_code: verifying_code!)!
        .then(
      (value) {
        if (value is verification) {
          if (value.code == 200) {
            Navigator.pushNamed(context, '/registrationPage' );
          } else {
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
      body: GestureDetector(
        onTap: () {},
        child:
            // SizedBox(
            //   height: MediaQuery.of(context).size.height,
            //   width: MediaQuery.of(context).size.width,
            // child:
            SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 10),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    'assets/images/otp.gif',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              FadeAnimation(
                1,
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Email Verfication',
                    style: TextStyle1(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        size: 22),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 25),
                child: RichText(
                  text: TextSpan(
                    text: "Enter the code sent to ",
                    children: [
                      TextSpan(
                        text: "${widget.email}",
                        style: TextStyle1(color: Colors.black, size: 14),
                      ),
                    ],
                    style: TextStyle1(
                        color: Colors.black,
                        size: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FadeAnimation(
                1,
                Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 1.0,
                      horizontal: 30,
                    ),
                    child: PinCodeTextField(
                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: Colors.purple.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 5,
                      obscureText: true,
                      obscuringCharacter: '*',
                      // obscuringWidget: const FlutterLogo(
                      //   size: 24,
                      // ),
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      // validator: (v) {
                      //   if (v!.length < 5) {
                      //     return "please enter the full code";
                      //   } else {
                      //     return null;
                      //   }
                      // },
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(10),
                        fieldHeight: 40,
                        fieldWidth: 40,
                        inactiveFillColor: Color.fromRGBO(143, 148, 251, 1),
                        //  Color.fromRGBO(143, 148, 251, .6),

                        inactiveColor: Color.fromRGBO(143, 148, 251, 1),
                        activeColor: Color.fromRGBO(143, 148, 251, 1),
                        activeFillColor: Colors.white,
                        selectedFillColor: Colors.indigo[100],
                        selectedColor: Colors.indigo[100],
                      ),
                      cursorColor: Colors.black,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      errorAnimationController: errorController,
                      controller: textEditingController,
                      keyboardType: TextInputType.number,
                      boxShadows: const [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                      onCompleted: (v) {
                        setState(() {
                          current_code = int.tryParse(v);
                        });

                        debugPrint(v);
                      },
                      // onTap: () {
                      //   print("Pressed");
                      // },
                      onChanged: (value) {
                        debugPrint(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        debugPrint("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  hasError ? "*Please fill up all the cells properly" : "",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Didn't receive the code? ",
                    style: TextStyle(color: Colors.black54, fontSize: 15),
                  ),
                  TextButton(
                    onPressed: () => snackBar("OTP resend!!"),
                    child: const Text(
                      "RESEND",
                      style: TextStyle(
                        color: Colors.black,
                        // fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              FadeAnimation(
                1,
                custom_Button(
                  width: width,
                  height: height,
                  title: 'Verify',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      await triggerButton(verifying_code: current_code);
                    }
                  },
                ),
              ),
              // Container(
              //   margin:
              //       const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
              //   child: ButtonTheme(
              //     height: 50,
              //     child: TextButton(
              //       onPressed: () {

              //         formKey.currentState!.validate();
              //         // conditions for validating
              //         if (currentText.length != 6 || currentText != "123456") {
              //           errorController!.add(ErrorAnimationType
              //               .shake); // Triggering error shake animation
              //           setState(() => hasError = true);
              //         } else {
              //           setState(
              //             () {
              //               hasError = false;
              //               snackBar("OTP Verified!!");
              //             },
              //           );
              //         }
              //       },
              //       child: Center(
              //         child: Text(
              //           "VERIFY".toUpperCase(),
              //           style: const TextStyle(
              //             color: Colors.white,
              //             fontSize: 18,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              //   decoration: BoxDecoration(
              //       color: Colors.green.shade300,
              //       borderRadius: BorderRadius.circular(5),
              //       boxShadow: [
              //         BoxShadow(
              //             color: Colors.green.shade200,
              //             offset: const Offset(1, -2),
              //             blurRadius: 5),
              //         BoxShadow(
              //             color: Colors.green.shade200,
              //             offset: const Offset(-1, 2),
              //             blurRadius: 5)
              //       ]),
              // ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: TextButton(
                      child: Text(
                        "Clear",
                        style: TextStyle1(color: Colors.black, size: 14),
                      ),
                      onPressed: () {
                        textEditingController.clear();
                      },
                    ),
                  ),
                  // Flexible(
                  //   child: TextButton(
                  //     child: const Text("Set Text"),
                  //     onPressed: () {
                  //       setState(() {
                  //         textEditingController.text = "123456";
                  //       });
                  //     },
                  //   ),
                  // ),
                ],
              )
            ],
          ),
        ),
        // ),
      ),
    );
  }
}
