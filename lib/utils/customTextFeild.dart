import 'package:flutter/material.dart';

Widget? textFieldForLoginAndRegister(
  {
    String? hint,
  }
) {
  return TextField(
    decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Email or Phone number",
        hintStyle: TextStyle(color: Colors.grey[400])),
  );
}
