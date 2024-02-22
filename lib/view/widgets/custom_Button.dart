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

Widget custom_Button_with_Icon({double? width, double? height, void Function()? onTap , String? title , String? pathOfPicture}) {
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
              : Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(child: Text(title! , style: TextStyle1(color: Colors.black , size: 14),)),
                  Image.asset(pathOfPicture! , width: 30 , height: 30,),
                ],
              ),
          width: width,
          height: height,
          duration: Duration(seconds: 1)));
}
