
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  final String text;
  final String ImageName;
final  void Function() onPressed;
  CustomButtonSocial( {  this.text ,    this.ImageName,  this.onPressed,  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade50
      ),

      child:FlatButton(onPressed: onPressed,
      child: Row(
        children: [
          Image.asset(ImageName),
          //SizedBox( width: 80,),
          CustomText(text: this.text,)
        ],
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10,)
      ),

    ),
    );
  }

}