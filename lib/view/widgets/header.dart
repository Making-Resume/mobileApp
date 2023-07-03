import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utils/loginPageAnimation.dart';

custom_header({String? path, BuildContext? context}) {
  return Container(
    height: 400,
    width: MediaQuery.of(context!).size.width,
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.fill)),
    child: Stack(
      children: <Widget>[
        // Positioned(
        //   left: 30,
        //   width: 80,
        //   height: 200,
        //   child: FadeAnimation(
        //       1,
        //       Container(
        //         decoration: BoxDecoration(
        //             image: DecorationImage(
        //                 image: AssetImage('assets/images/light-1.png'))),
        //       )),
        // ),
        // Positioned(
        //   left: 140,
        //   width: 80,
        //   height: 150,
        //   child: FadeAnimation(
        //       1.3,
        //       Container(
        //         decoration: BoxDecoration(
        //             image: DecorationImage(
        //                 image: AssetImage('assets/images/light-2.png'))),
        //       )),
        // ),
        // Positioned(
        //   right: 40,
        //   top: 40,
        //   width: 80,
        //   height: 150,
        //   child: FadeAnimation(
        //       1.5,
        //       Container(
        //         decoration: BoxDecoration(
        //             image: DecorationImage(
        //                 image: AssetImage('assets/images/clock.png'))),
        //       )),
        // ),

        // Positioned(
        //   child: FadeAnimation(
        //       1.6,
        //       Container(
        //         margin: EdgeInsets.only(top: 50),
        //         child: Center(
        //           child: Text(
        //             title!,
        //             style: TextStyle(
        //                 color: Colors.white,
        //                 fontSize: 40,
        //                 fontWeight: FontWeight.bold),
        //           ),
        //         ),
        //       )),

        // )
        Center(
          child: FadeAnimation(
            1.6,
            Container(
              //   height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),

                child: Lottie.asset(path!),

                //      Image.asset('assets/images/login.gif' ,
                // ),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
