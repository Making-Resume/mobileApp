import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../utils/loginPageAnimation.dart';
import 'widgets/custom_Button.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData.light(),
//       home: const HomePage(),
//     );
//   }
// }

class codeVerification extends StatefulWidget {
  const codeVerification({Key? key}) : super(key: key);

  @override
  State<codeVerification> createState() => _codeVerificationState();
}

class _codeVerificationState extends State<codeVerification> {
  String _code = "";
  String signature = "{{ app signature }}";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              "code verification",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 200,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  //const PhoneFieldHint(),
                  const Spacer(),
                  PinFieldAutoFill(
                    decoration: BoxLooseDecoration(
                        radius: Radius.circular(10.0),
                        bgColorBuilder: FixedColorBuilder(
                            Color.fromARGB(255, 255, 255, 255)),
                        strokeColorBuilder: FixedColorBuilder(Colors.black),
                        gapSpace: 16),
                    currentCode: _code,
                    onCodeSubmitted: (code) {},
                    onCodeChanged: (code) {
                      if (code!.length == 6) {
                        FocusScope.of(context).requestFocus(FocusNode());
                      }
                    },
                  ),
                  const Spacer(),
                  // TextFieldPinAutoFill(
                  //   currentCode: _code,
                  // ),
                  const Spacer(),
                    Center(
                      child: AnimatedButton(
                        text: 'Submit',
                        onPressed: (){
                        
                        },
                        width: 200,
                      )  
                    )
                  // ElevatedButton(
                  //   child: const Text('Set code to 123456'),
                  //   onPressed: () async {
                  //     setState(() {
                  //       _code = '123456';
                  //     });
                  //   },
                  // ),
                  // const SizedBox(height: 8.0),
                  // const Divider(height: 1.0),
                  // const SizedBox(height: 4.0),
                  // Text("App Signature : $signature"),
                  // const SizedBox(height: 4.0),
                  // ElevatedButton(
                  //   child: const Text('Get app signature'),
                  //   onPressed: () async {
                  //     signature = await SmsAutoFill().getAppSignature;
                  //     setState(() {});
                  //   },
                  // ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.of(context).push(MaterialPageRoute(builder: (_) => CodeAutoFillTestPage()));
                  //   },
                  //   child: const Text("Test CodeAutoFill mixin"),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class CodeAutoFillTestPage extends StatefulWidget {
  const CodeAutoFillTestPage({Key? key}) : super(key: key);

  @override
  State<CodeAutoFillTestPage> createState() => _CodeAutoFillTestPageState();
}

class _CodeAutoFillTestPageState extends State<CodeAutoFillTestPage>
    with CodeAutoFill {
  String? appSignature;
  String? otpCode;

  @override
  void codeUpdated() {
    setState(() {
      otpCode = code!;
    });
  }

  @override
  void initState() {
    super.initState();
    listenForCode();

    SmsAutoFill().getAppSignature.then((signature) {
      setState(() {
        appSignature = signature;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    cancel();
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 18);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Listening for code"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
            child: Text(
              "This is the current app signature: $appSignature",
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Builder(
              builder: (_) {
                if (otpCode == null) {
                  return const Text("Listening for code...", style: textStyle);
                }
                return Text("Code Received: $otpCode", style: textStyle);
              },
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
