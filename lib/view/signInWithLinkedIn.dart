import 'package:flutter/material.dart';
import 'package:resumemaker/view/widgets/custom_Button.dart';

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("with signing with liknedin , your resume will make very fast")
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
                  width: 400,
                  height: 50,
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
            )
          ],
        ),
      ),
    );
  }
}
