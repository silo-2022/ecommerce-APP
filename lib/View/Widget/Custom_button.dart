import 'package:flutter/material.dart';

import '../Constant.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;


  CustomButton( { this.text = "",     this.onPressed, });
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(18),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onPressed:onPressed,
      color: primeryColor,
      child: CustomText(text: "SIGN IN",alignment: Alignment.center,color: Colors.white,),)
    ;
  }

}