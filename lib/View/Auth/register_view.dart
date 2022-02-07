import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '/View/Auth/login_screen.dart';
import '/View/Widget/Custom_button.dart';
import '/View/Widget/custom_text.dart';
import '/View/Widget/custom_text_form_field.dart';
import '/Core/ViewModel/Auth_View_Model.dart';
import '../Constant.dart';
import 'package:get/get.dart';
class RegisterView extends GetWidget<AuthViewModel>{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading:  GestureDetector(

              onTap: (){
                Get.off(LoginScreen());
              },

              child: Icon(Icons.arrow_back, color: Colors.black,)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(

                children: [


                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[

                        CustomText(text:"Sign Up", fontsize: 18, color:  primeryColor,),

                      ]
                    //T

                  ) ,
                  SizedBox(
                    height: 10,
                  ) ,
                  CustomText(text: "Sign in to continue",color: Colors.grey, fontsize: 13,)    ,
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      CustomTextformField(
                        text: "name",
                        hint: "Rana",
                        onSaved: (value){
                          controller.name= value;


                        },
                        validator: (value){
                          if(value==null){
                            print("Error");
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      CustomTextformField(
                        text: "Email",
                        hint: "aaa@info.com",
                        onSaved: (value){controller.email = value;


                        },
                        validator: (value){
                          if(value==null){
                            print("Error");
                          }
                        },
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      CustomTextformField(
                        text: "Password",
                        hint: "******",
                        onSaved: (value){
                          controller.password = value;


                        },
                        validator: (value){
                          if(value==null){
                            print("Error");
                          }
                        },
                      ),
                      SizedBox(
                        height: 40,
                      ),


                      CustomButton(text:
                      "SIGN UP",onPressed: (){
                        _formKey.currentState.save();
                        if(_formKey.currentState.validate()) {

                          controller.CreatAccwithEmailpass();
                        }

                        //Get.to(secondscreen());
                      }),
                      const SizedBox(
                        height: 20,
                      ),


                    ],

                  )
                ],

              ),
            ),
          ),
        )

    );
  }

}