import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../utils/const/textStyle.dart';

class addAlertDialogForLanguageSkill extends StatefulWidget {
  String? firstWord;
  String? secondWord;
  String? thirdWord;
  String? forthWord;

  addAlertDialogForLanguageSkill({this.firstWord, this.secondWord});

  @override
  State<addAlertDialogForLanguageSkill> createState() =>
      _addAlertDialogForLanguageSkillState();
}

class _addAlertDialogForLanguageSkillState
    extends State<addAlertDialogForLanguageSkill> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 180,
        width: 300,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.firstWord!, style: TextStyle1(size: 13)),
              TextField(

                decoration: InputDecoration(
                  
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: Color.fromRGBO(
                            143, 148, 251, 1) // Change border color here
                        ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(
                            143, 148, 251, 1) // Change border color here
                        ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(
                            143, 148, 251, 1) // Change border color here
                        ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: EdgeInsets.all(10),
                  errorStyle: TextStyle1(color: Colors.red[400], size: 11),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(
                            143, 148, 251, 1) // Change border color here
                        ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: widget.firstWord,
                  hintStyle: TextStyle(color: Colors.grey[400]),
                ),
              ),
              SizedBox(
                height: 17,
              ),
              Text(
                widget.secondWord!,
                style: TextStyle1(size: 13),
              ),
              // TextField(
              //   decoration: InputDecoration(
              //     focusedBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10),
              //       borderSide: BorderSide(
              //           color: Color.fromRGBO(
              //               143, 148, 251, 1) // Change border color here
              //           ),
              //     ),
              //     enabledBorder: OutlineInputBorder(
              //       borderSide: BorderSide(
              //           color: Color.fromRGBO(
              //               143, 148, 251, 1) // Change border color here
              //           ),
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     disabledBorder: OutlineInputBorder(
              //       borderSide: BorderSide(
              //           color: Color.fromRGBO(
              //               143, 148, 251, 1) // Change border color here
              //           ),
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     contentPadding: EdgeInsets.all(10),
              //     errorStyle: TextStyle1(color: Colors.red[400], size: 11),
              //     border: OutlineInputBorder(
              //       borderSide: BorderSide(
              //           color: Color.fromRGBO(
              //               143, 148, 251, 1) // Change border color here
              //           ),
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     hintText: widget.secondWord,
              //     hintStyle: TextStyle(color: Colors.grey[400]),
              //   ),
              // ),

              RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 2),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  size: 9,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
