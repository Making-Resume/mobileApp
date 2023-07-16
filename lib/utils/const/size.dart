
import 'package:flutter/material.dart';

class DeviceSize{

 static var  height;
 static var width;

  static getHeight(BuildContext context){
    height = MediaQuery.of(context).size.height;
    return height;
  }

 static getWidth(BuildContext context){
    width = MediaQuery.of(context).size.width;
    return width;
  }

}