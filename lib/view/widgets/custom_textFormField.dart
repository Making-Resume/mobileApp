import 'package:flutter/material.dart';

class customTextFormfield extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  String? Function(String?)? validator;
  String? hintText;
  bool? obscureText;
  customTextFormfield({this.controller, this.label , this.hintText , this.validator , this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
    //  padding: EdgeInsets.fromLTRB(10,2,10,2),
           
      child:TextFormField(
              
                controller: controller,
                decoration: InputDecoration(
                  
                            enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black), // Border color when the field is enabled
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black), // Border color when the field is focused
            borderRadius: BorderRadius.circular(10),
          ),
                  labelText: label,
                  hintText: hintText
                  
                ),
                validator: validator,
                obscureText: obscureText!,
                
              ),
    );
  }
}