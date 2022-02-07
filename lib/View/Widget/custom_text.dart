
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontsize;
  final Alignment alignment;
   Color color ;
  CustomText( { this.text = "",   this.color=Colors.black,  this.fontsize=16, this.alignment=Alignment.topLeft});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: this.alignment,
      child: Text(this.text,style: TextStyle(color: this.color,fontSize: this.fontsize),),

    );
  }

  }