import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class show_full_screen_image extends StatelessWidget {
  String? image;
  show_full_screen_image({this.image});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        child: Image.network(''),
      ),
    );
  }
}