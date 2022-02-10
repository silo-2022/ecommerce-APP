
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontsize;
  final Alignment alignment;
  final int maxLine;
   Color color ;
   final double height;
  CustomText( { this.text = "",   this.color=Colors.black,  this.fontsize=16, this.height = 1, this.alignment=Alignment.topLeft, this.maxLine});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: this.alignment,
      child: Text(this.text,style: TextStyle(color: this.color,

          height: height,
          fontSize: this.fontsize),),

    );
  }

  }