import 'package:ecom/View/Widget/custom_text.dart';
import 'package:ecom/View/Widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

            //SizedBox(height: 10,),
              CustomText(text: "Billing address is the same as delivery",
              fontsize: 20,alignment: Alignment.center,),
              SizedBox(height: 10,),
              CustomTextformField(text: "Street 1",
              hint: '21, Alex ..',),
              SizedBox(height: 10,),
              CustomTextformField(text: "Street 2",
                hint: 'Opposite ...',),
              SizedBox(height: 10,),
              CustomTextformField(text: "City",
                hint: 'Kuwait',),
              SizedBox(height: 10,),
              Container(
                width: Get.width,
                child:
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: CustomTextformField(text: "State",
                          hint: 'Kuwait',),
                      ),
                    ),
                    SizedBox(width: 10,),
                   Expanded(
                      child: Padding(
                   padding: const EdgeInsets.only(right: 10),
                        child:CustomTextformField(text: "Country",
                      hint: 'Kuwait',),),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
