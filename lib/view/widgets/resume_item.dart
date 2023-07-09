import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../models/singleResume.dart';
import '../../utils/const/textStyle.dart';
import 'avatarOfResumesItem.dart';

class ResumeTile extends StatelessWidget {
  ResumeTile({
    required this.resume,
    this.showCaseKey,
    this.showCaseDetail = false,
  });

  final bool showCaseDetail;
  GlobalKey? showCaseKey = GlobalKey();
  final singleResume resume;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 6, right: 16, top: 8, bottom: 8),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: <Widget>[
                //     Container(
                //       width: 45,
                //       height: 45,
                //       decoration: const BoxDecoration(
                //         shape: BoxShape.circle,
                //         color: Color(0xffFCD8DC),
                //       ),
                //       child: Center(
                //         child: Text(
                //           'S',
                //           style: TextStyle(
                //             color: Theme.of(context).primaryColor,
                //             fontWeight: FontWeight.bold,
                //             fontSize: 16,
                //           ),
                //         ),
                //       ),
                //     ),
                //     const SizedBox(
                //       height: 10,
                //     ),
                //     const Text(
                //       "Your sender's profile ",
                //       style: TextStyle(color: Colors.white),
                //     )
                //   ],
                // ),

                SAvatarExampleChild(
                  urlPicture: resume.picture,
                ),
                const Padding(padding: EdgeInsets.only(left: 8)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        resume.title!,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(resume.type!,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle1(
                            color: Colors.grey,
                            size: 14,
                          )),
                      // Text(
                      //   resume.description!,
                      //   overflow: TextOverflow.ellipsis,
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.normal,
                      //     color:
                      //         // resume.isUnread
                      //         //     ? Theme.of(context).primaryColor
                      //         //  :
                      //         Colors.black,
                      //     fontSize: 15,
                      //   ),
                      // ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 50,
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 5,
                ),
                Text(
                  resume.date!,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                showCaseDetail ?
                  Showcase(
                    key: showCaseKey!,
                    title: 'view resume',
                    description: 'Click here to view and edit resume',
                    targetShapeBorder: const CircleBorder(),
                    child: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  ):
              
                  Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
