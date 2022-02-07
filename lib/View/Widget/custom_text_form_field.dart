import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextformField extends StatelessWidget {
  final String text;
  final String hint;
  final Function onSaved;
  final Function validator;


CustomTextformField({ this.text, this.hint,   this.onSaved,   this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(
            text: text, fontsize: 14, color: Colors.grey.shade900,
          ),
          TextFormField(
            onSaved: onSaved,
            validator: validator,
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: Colors.grey)  ,
                fillColor: Colors.white
            ),
          )
        ],

      )

    );
  }
}
