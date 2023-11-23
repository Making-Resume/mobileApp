import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:resumemaker/utils/const/textStyle.dart';

import '../../models/template_typeModel.dart';
import '../../utils/const/size.dart';

class TemplateItem extends StatelessWidget {
  TemplateItem(
      {required this.template_typeModel,
      this.showCaseKey,
      // this.showCaseDetail = false,
      this.index});

  //final bool showCaseDetail;
  final int? index;
  GlobalKey? showCaseKey = GlobalKey();
  final Template_TypeModel template_typeModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              child: Stack(children: [
                Container(
                    height: DeviceSize.getHeight(context) * 0.49,
                    width: DeviceSize.getHeight(context) * 0.20,
                    decoration: BoxDecoration(
                        // image: DecorationImage(
                        //   fit: BoxFit.fill,
                        //   //  opacity: 0.2,

                        //   image: NetworkImage(

                        //     template_typeModel.imagePath!,
                        //   ),
                        //   ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, .6),
                          )
                        ],
                        border: Border.all(
                            color: Color.fromRGBO(143, 148, 251, .6),
                            width: 4.0),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(143, 148, 251, 1),
                            Colors.white.withOpacity(0.2),
                            Colors.white.withOpacity(0.5),
                          ],
                          stops: [0.0, 0.5, 1.0],
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                    
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl: template_typeModel.imagePath!,
                        placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(
                            //value: downloadProgress.progress,
                            color: Colors.white,
                            strokeWidth: 3,
                          ),
                        ),
                        // progressIndicatorBuilder: (context, url, downloadProgress) =>
                        //     Center(
                        //         // widthFactor: 20,
                        //         // heightFactor: 20,
                        //         child: CircularProgressIndicator(
                        //   value: downloadProgress.progress,
                        //   color: Colors.white,
                        //   strokeWidth: 3,
                        // )),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    )
                    // child: Center(
                    //   child: Text(template_typeModel.text!,
                    //       textAlign: TextAlign.left,
                    //       overflow: TextOverflow.ellipsis,
                    //       style: TextStyle1(
                    //         color: Colors.white,
                    //         size: 20,
                    //       )),
                    // ),
                    ),
              ]),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: 200,
              height: 50,
              child: Text(
                'This is a professional cv and it is related to cv',
                textAlign: TextAlign.center,
                style: TextStyle1(
                  size: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
