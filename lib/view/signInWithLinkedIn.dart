import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:resumemaker/view/widgets/custom_Button.dart';
import 'package:resumemaker/utils/const/size.dart';

class signInWithLinkedIn extends StatefulWidget {
  const signInWithLinkedIn({Key? key}) : super(key: key);

  @override
  State<signInWithLinkedIn> createState() => _signInWithLinkedInState();
}

class _signInWithLinkedInState extends State<signInWithLinkedIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Sign In with LinkedIn'),
        backgroundColor: Color.fromRGBO(143, 148, 251, 1),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 50, top: 20),
              height: DeviceSize.getHeight(context) * 0.4,
              width: DeviceSize.getWidth(context) * 0.5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Lottie.asset("assets/images/linkedin.json"),

                //      Image.asset('assets/images/login.gif' ,
                // ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    "with signing with liknedin , your resume will make very fast")
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                custom_Button_with_Icon(
                  pathOfPicture: "assets/images/linkedin.png",
                  height: DeviceSize.getHeight(context) * 0.09,
                  width: DeviceSize.getWidth(context) * 0.8,
                  title: 'Sign In with Linkedin',
                  onTap: () async {
                    // if (_formKey.currentState!.validate()) {
                    //   await triggerButton(
                    //     email: emailController.text,
                    //   );
                    // }
                  },
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            TextButton(
              onPressed: () {
                print("ok");
              },
              child: Text("if you dont have an linkedin account , click here"),
            ),
          ],
        ),
      ),
    );
  }
}
