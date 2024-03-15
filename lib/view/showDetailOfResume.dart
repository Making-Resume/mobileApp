import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:resumemaker/utils/const/textStyle.dart';
import 'package:resumemaker/utils/loginPageAnimation.dart';

class showDetailOfResume extends StatefulWidget {
  const showDetailOfResume({Key? key}) : super(key: key);

  @override
  State<showDetailOfResume> createState() => _showDetailOfResumeState();
}

class _showDetailOfResumeState extends State<showDetailOfResume> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(143, 148, 251, 1),
        centerTitle: true,
        title: DefaultTextStyle(
          style: TextStyle1(
            color: Colors.white,
            size: 18,
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              ColorizeAnimatedText(
                "Resume Detail",
                colors: [
                  Colors.white,
                  Color.fromRGBO(143, 148, 251, 1),
                  Color.fromRGBO(121, 127, 241, 1),
                ],
                speed: Duration(milliseconds: 350),
                textStyle: TextStyle1(
                  // color: Colors.white,
                  size: 18,
                ),
              ),
              // WavyAnimatedText('Look at the waves'),
            ],
            repeatForever: true,
            isRepeatingAnimation: true,
            onTap: () {
              print("Tap Event");
            },
          ),
        ),
        // Text("Show Resume detail"),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "name of resume",
              style: TextStyle1(size: 17),
            ),
          ],
        ),
        SizedBox(
          height: 4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "resume detail",
              style: TextStyle1(size: 14),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        FadeAnimation(
          3,
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl:
                              'https://marketplace.canva.com/EAFUtflIkDU/2/0/1131w/canva-pink-black-%26-white-minimalist-photo-high-school-resume-wtTKJtesNFc.jpg',
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(
                              //value: downloadProgress.progress,
                              color: Colors.purple,
                              strokeWidth: 3,
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    );
                  });
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                width: 350,
                fit: BoxFit.cover,
                imageUrl:
                    'https://marketplace.canva.com/EAFUtflIkDU/2/0/1131w/canva-pink-black-%26-white-minimalist-photo-high-school-resume-wtTKJtesNFc.jpg',
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    //value: downloadProgress.progress,
                    color: Colors.white,
                    strokeWidth: 3,
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.share),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.edit),
            )
          ],
        )
      ]),
    );
  }
}
