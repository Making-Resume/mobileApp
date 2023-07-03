import 'package:flutter/material.dart';
import 'package:resumemaker/utils/const/textStyle.dart';

Widget custom_Button({double? width, double? height, void Function()? onTap , String? title}) {
  return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            gradient: LinearGradient(colors: [
              Color.fromRGBO(143, 148, 251, 1),
              Color.fromRGBO(143, 148, 251, .6),
            ]),
          ),
          child: width! == 50
              ? Center(
                  child: CircularProgressIndicator(
                  color: Colors.white,
                ))
              : Center(child: Text(title! , style: TextStyle1(color: Colors.black , size: 14),)),
          width: width,
          height: height,
          duration: Duration(seconds: 1)));
}
