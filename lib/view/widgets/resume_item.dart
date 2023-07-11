import 'dart:ui';

import 'package:animated_icon/animated_icon.dart';
import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../models/singleResume.dart';
import '../../utils/const/textStyle.dart';
import 'avatarOfResumesItem.dart';

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
          borderRadius: BorderRadius.circular(20),
          child: Container(
            child: Stack(children: [
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 7,
                  sigmaY: 7,
                ),
                child: Container(
                  height: 190,
                  width: 360,
                ),
              ),
              Expanded(
                child: Container(
                  height: 190,
                  width: 360,
                  decoration: BoxDecoration(
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
                          // Colors.white.withOpacity(0.5),
                          Colors.white.withOpacity(0.2)
                        ],
                        stops: [0.0, 1.0],
                      ),
                      borderRadius: BorderRadius.circular(20)),
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Flexible(
                                child: Text(
                                resume.title!,
                                                        
                                 overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Flexible(
                                child: Text(resume.type!,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle1(
                                      color: Colors.black87,
                                      size: 14,
                                    )),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Flexible(
                                child: Text(
                                  resume.date!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 9,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Expanded(
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
                                            targetShapeBorder: const CircleBorder(),
                                            child: AnimateIcon(
                                              color:
                                                  Color.fromRGBO(143, 148, 251, 1),
                                              //key: UniqueKey(),
                                              onTap: () {},
                                              iconType: IconType.continueAnimation,
                                              height: 20,
                                              width: 20,
                                            
                                              animateIcon: AnimateIcons.eye,
                                            ),
                                          )
                                        : Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: const Icon(
                                              Icons.remove_red_eye,
                                              size: 22.0,
                                              color:
                                                  Color.fromRGBO(143, 148, 251, 1),
                                            ),
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
