import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/Core/ViewModel/Auth_View_Model.dart';
import '/View/Auth/register_view.dart';
import '/View/Auth/second_screen.dart';
import '/View/Constant.dart';
import '/View/Widget/Custom_Button_Social.dart';
import '/View/Widget/Custom_button.dart';
import '/View/Widget/custom_text.dart';
import '/View/Widget/custom_text_form_field.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
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
                    CustomText(text:"Sign Up", fontsize: 30,),
                    GestureDetector(
                        onTap: (){
                          Get.to(RegisterView());
                        },
                        child: CustomText(text:"Sign Up", fontsize: 18, color:  primeryColor,)),

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
                      height: 20,
                    ),
                    CustomText(text: "Forget Password?", fontsize: 14,alignment: Alignment.bottomRight,),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(text:
                    "SIGN IN",onPressed: (){
                      _formKey.currentState.save();
                      if(_formKey.currentState.validate()) {

                        controller.signINwithEmailpass();
                      }

                      //Get.to(secondscreen());
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomText(text: "-OR-",alignment: Alignment.center,),
                 CustomButtonSocial(text: "Sign in with Facebook",ImageName: 'assets/fb.jpg', onPressed: (){},),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButtonSocial(ImageName: 'assets/fb.jpg', text: 'Sign in with Google', onPressed: (){

                    controller.goodleSignInMethod();
                    },),
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