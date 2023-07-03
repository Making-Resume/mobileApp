           
   import 'package:flutter/material.dart';

import '../../utils/const/textStyle.dart';

 void show_message({String? message , BuildContext? context}){        
      ScaffoldMessenger.of(context!).showSnackBar(
              SnackBar(
                //   padding: EdgeInsets.symmetric(vertical: 20),
                backgroundColor: Colors.indigoAccent,
                content: Container(
                    height: 20,
                    child: Text(
                     // 'Registration Successful!',
                     message!,
                      style: TextStyle1(color: Colors.white, size: 14),
                    )),
                duration: Duration(seconds: 2),
              ),
            );
}