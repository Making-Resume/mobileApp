import 'package:flutter/material.dart';
import 'package:resumemaker/utils/const/textStyle.dart';

class customTextFormfield extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  String? Function(String?)? validator;
  String? hintText;
  bool? obscureText;
  customTextFormfield(
      {this.controller,
      this.label,
      this.hintText,
      this.validator,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return
    // Container(
   //   padding: EdgeInsets.symmetric(horizontal: 2 , vertical: 2),
     // child:
       TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obscureText!,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
          errorStyle: TextStyle1(color:Colors.red[400] , size: 11),
            // border: OutlineInputBorder(
            //   borderSide: BorderSide(),
            // ),
            
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[400])),
      );
   // );
    // return Container(
    // //  padding: EdgeInsets.fromLTRB(10,2,10,2),
    //                                          padding: EdgeInsets.all(8.0),
    //                               decoration: BoxDecoration(
    //                                   border: Border(
    //                                       bottom: BorderSide(
    //                                           color: (Colors.grey[100])!))),
    //   child:TextFormField(

    //             controller: controller,
    //             decoration: InputDecoration(
    //               border: InputBorder.none,
    //       //                   enabledBorder: OutlineInputBorder(
    //       //   borderSide: BorderSide(color: Colors.black), // Border color when the field is enabled
    //       //   borderRadius: BorderRadius.circular(10),
    //       // ),
    //       // focusedBorder: OutlineInputBorder(
    //       //   borderSide: BorderSide(color: Colors.black), // Border color when the field is focused
    //       //   borderRadius: BorderRadius.circular(10),
    //       // ),
    //               labelText: label,
    //               hintText: hintText

    //             ),
    //             validator: validator,
    //             obscureText: obscureText!,

    //           ),

    // );

    // child: TextField(
    //   decoration: InputDecoration(
    //       border: InputBorder.none,
    //       hintText: "Email or Phone number",
    //       hintStyle:
    //           TextStyle(color: Colors.grey[400])),
    // ),
  }
}
