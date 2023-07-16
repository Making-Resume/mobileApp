import 'dart:ui';

import 'package:animated_icon/animated_icon.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:resumemaker/utils/const/size.dart';
import 'package:resumemaker/view/widgets/avatarOfResumesItem.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../models/singleResume.dart';
import '../../utils/const/textStyle.dart';

class ResumeTile extends StatelessWidget {
  ResumeTile(
      {required this.resume,
      this.showCaseKey,
      this.showCaseDetail = false,
      this.index});

  final bool showCaseDetail;
  final int? index;
  GlobalKey? showCaseKey = GlobalKey();
  final singleResume resume;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: (index! % 2) == 0 ? TextDirection.ltr : TextDirection.rtl,
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            child: Stack(
              children: [
              BackdropFilter(
              
                filter: ImageFilter.blur(
                  sigmaX: 2,
                  sigmaY: 2,
                
                ),
                child: Container(
                  height: DeviceSize.getHeight(context) * 0.3,
                  width: DeviceSize.getHeight(context) * 0.6,
            
                )
              ),
              Container(
                height: DeviceSize.getHeight(context) * 0.3,
                width: DeviceSize.getHeight(context) * 0.6,
                decoration: BoxDecoration(
                  
                             image:DecorationImage(
                              fit: BoxFit.fill,
                              opacity: 0.4,
                      image: NetworkImage(
                        'https://www.filepicker.io/api/file/4CcxWBfKQZOYlBlzOWU0',

                        ),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(143, 148, 251, .6),
                      )
                    ],
                    border: Border.all(
                        color: Colors.white.withOpacity(0.2), width: 1.0),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(143, 148, 251, 1),
                        Colors.white.withOpacity(0.2),
                        Colors.white.withOpacity(0.5),
                      ],
                      stops: [0.0, 0.5, 1.0],
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      SAvatarExampleChild(
                        urlPicture: resume.picture,
                      ),
                      const Padding(padding: EdgeInsets.only(left: 20)),
                      Expanded(
                        child: Column(
                          // crossAxisAlignment: (index! % 2) == 0  ?  CrossAxisAlignment.start :  CrossAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              child: showCaseDetail ?
                              
                              DefaultTextStyle(
                                style: TextStyle1(
                                  color: Colors.white,
                                  size: 18,
                                ),
                                child: AnimatedTextKit(
                                
                                  animatedTexts: [
                                    ColorizeAnimatedText(
                                      
                                      resume.title! , colors: [
                                      Colors.white,
                                  
                                      Color.fromRGBO(143, 148, 251, 1),
                                      Color.fromRGBO(121, 127, 241, 1),
                                    ],
                                    speed: Duration(milliseconds: 350),
                                    textStyle:  TextStyle1(
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
                              )
                              :
                              Text(
                              resume.title!,

                                 textAlign: TextAlign.left,
                               overflow: TextOverflow.ellipsis,
                                style: TextStyle1(
                                    color: Colors.white,
                                    size: 20,
                                  )
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Flexible(
                              child: Text(resume.type!,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: TextStyle1(
                                    color: Colors.white,
                                    size: 18,
                                  )),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Flexible(
                              child: Text(
                                resume.date!,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Flexible(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  showCaseDetail
                                      ? Showcase(
                                          key: showCaseKey!,
                                          title: 'view resume',
                                          description:
                                              'Click here to view and edit resume',
                                          targetShapeBorder:
                                              const CircleBorder(),
                                          child: AnimateIcon(
                                            color: Color.fromRGBO(
                                                143, 148, 251, 1),
                                            //key: UniqueKey(),
                                            onTap: () {},
                                            iconType:
                                                IconType.continueAnimation,
                                            height: 20,
                                            width: 20,

                                            animateIcon: AnimateIcons.eye,
                                          ),
                                        )
                                      : Icon(
                                          Icons.remove_red_eye,
                                          size: 22.0,
                                          color:
                                              Color.fromRGBO(143, 148, 251, 1),
                                        ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );

    // Container(
    //   padding: const EdgeInsets.only(left: 6, right: 16, top: 8, bottom: 8),
    //   color: Colors.white,
    //   child: Row(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: <Widget>[
    //       Expanded(
    //         child: Row(
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: <Widget>[
    //             // Column(
    //             //   crossAxisAlignment: CrossAxisAlignment.start,
    //             //   children: <Widget>[
    //             //     Container(
    //             //       width: 45,
    //             //       height: 45,
    //             //       decoration: const BoxDecoration(
    //             //         shape: BoxShape.circle,
    //             //         color: Color(0xffFCD8DC),
    //             //       ),
    //             //       child: Center(
    //             //         child: Text(
    //             //           'S',
    //             //           style: TextStyle(
    //             //             color: Theme.of(context).primaryColor,
    //             //             fontWeight: FontWeight.bold,
    //             //             fontSize: 16,
    //             //           ),
    //             //         ),
    //             //       ),
    //             //     ),
    //             //     const SizedBox(
    //             //       height: 10,
    //             //     ),
    //             //     const Text(
    //             //       "Your sender's profile ",
    //             //       style: TextStyle(color: Colors.white),
    //             //     )
    //             //   ],
    //             // ),

    //             SAvatarExampleChild(
    //               urlPicture: resume.picture,
    //             ),
    //             const Padding(padding: EdgeInsets.only(left: 8)),
    //             Expanded(
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: <Widget>[
    //                   Text(
    //                     resume.title!,
    //                     overflow: TextOverflow.ellipsis,
    //                     style: TextStyle(
    //                       fontWeight: FontWeight.normal,
    //                       fontSize: 17,
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     height: 10,
    //                   ),
    //                   Text(resume.type!,
    //                       overflow: TextOverflow.ellipsis,
    //                       style: TextStyle1(
    //                         color: Colors.grey,
    //                         size: 14,
    //                       )),
    //                   // Text(
    //                   //   resume.description!,
    //                   //   overflow: TextOverflow.ellipsis,
    //                   //   style: TextStyle(
    //                   //     fontWeight: FontWeight.normal,
    //                   //     color:
    //                   //         // resume.isUnread
    //                   //         //     ? Theme.of(context).primaryColor
    //                   //         //  :
    //                   //         Colors.black,
    //                   //     fontSize: 15,
    //                   //   ),
    //                   // ),
    //                 ],
    //               ),
    //             )
    //           ],
    //         ),
    //       ),

    //     ],
    //   ),
    // );
  }
}
