import 'dart:ui';

import 'package:animated_icon/animated_icon.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:resumemaker/models/category_item.dart';
import 'package:resumemaker/utils/const/size.dart';
import 'package:resumemaker/view/widgets/avatarOfResumesItem.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../models/singleResume.dart';
import '../../utils/const/textStyle.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem(
      {required this.category_item,
      this.showCaseKey,
      // this.showCaseDetail = false,
      this.index});

  //final bool showCaseDetail;
  final int? index;
  GlobalKey? showCaseKey = GlobalKey();
  final Category_Item category_item;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            child: Stack(children: [
              BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 2,
                    sigmaY: 2,
                  ),
                  child: Container(
                    height: DeviceSize.getHeight(context) * 0.15,
                    width: DeviceSize.getHeight(context) * 0.6,
                  )),
              Container(
                height: DeviceSize.getHeight(context) * 0.15,
                width: DeviceSize.getHeight(context) * 0.6,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      opacity: 0.4,
                      image: NetworkImage(
                        category_item.imagePath!,
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
                child: Center(
                  child: Text(category_item.text!,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle1(
                        color: Colors.white,
                        size: 20,
                      )),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
