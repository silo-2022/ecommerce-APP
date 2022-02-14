import 'package:ecom/Core/ViewModel/prof_view_model.dart';
import 'package:ecom/View/Widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Auth/login_screen.dart';

class ProfileView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<ProfViewModel>(
      init: ProfViewModel(),
      builder:(controller)=>
          controller.loading.value==true? Center(child: CircularProgressIndicator())
          :Scaffold(

          body: Container(
            padding: EdgeInsets.only(top: 50),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(100),

                            ),
                            image: DecorationImage(
                                image: controller.userModel == null
                                    ? AssetImage('assets/prof2.png')
                                :controller.userModel.pic=='default'
                                    ?AssetImage('assets/prof2.png')
                                    :NetworkImage(controller.userModel.pic),
                              fit: BoxFit.fill
                            )
                          ),

                        ),
                        Column(
                          children: [
                            CustomText(text: controller.userModel.name,color: Colors.black,fontsize: 24,),
                            CustomText(text: controller.userModel.email,color: Colors.black,fontsize: 24,),

                          ],
                        )
                      ],
                    ),

                  ),
                  SizedBox(height: 100,),
                  Container(
                    child: FlatButton(
                      onPressed: (){

                      },
                      child: ListTile(
                        title: CustomText(
                          text: "Edit Profile",
                        ),
                        leading: Image.asset('assets/prof.png'),
                        trailing: Icon(Icons.navigate_next, color: Colors.black,),
                      ),
                    )
                  ),
                  SizedBox(height: 20,),
                  Container(
                      child: FlatButton(
                        onPressed: (){

                        },
                        child: ListTile(
                          title: CustomText(
                            text: "Shipping Address",
                          ),
                          leading: Image.asset('assets/prof.png'),
                          trailing: Icon(Icons.navigate_next, color: Colors.black,),
                        ),
                      )
                  ),
                  SizedBox(height: 20,),
                  Container(
                      child: FlatButton(
                        onPressed: (){

                        },
                        child: ListTile(
                          title: CustomText(
                            text: "Order Historu",
                          ),
                          leading: Image.asset('assets/prof.png'),
                          trailing: Icon(Icons.navigate_next, color: Colors.black,),
                        ),
                      )
                  ),
                  SizedBox(height: 20,),
                  Container(
                      child: FlatButton(
                        onPressed: (){

                        },
                        child: ListTile(
                          title: CustomText(
                            text: "Cards",
                          ),
                          leading: Image.asset('assets/prof.png'),
                          trailing: Icon(Icons.navigate_next, color: Colors.black,),
                        ),
                      )
                  ),
                  SizedBox(height: 20,),
                  Container(
                      child: FlatButton(
                        onPressed: (){

                        },
                        child: ListTile(
                          title: CustomText(
                            text: "Notifications",
                          ),
                          leading: Image.asset('assets/prof.png'),
                          trailing: Icon(Icons.navigate_next, color: Colors.black,),
                        ),
                      )
                  ),
                  SizedBox(height: 20,),
                  Container(
                      child: FlatButton(
                        onPressed: (){
                          controller.signOut();
                          Get.offAll(LoginScreen());
                        },
                        child: ListTile(
                          title: CustomText(
                            text: "Log Out",
                          ),
                          leading: Image.asset('assets/prof.png'),
                          trailing: Icon(Icons.navigate_next, color: Colors.black,),
                        ),
                      )
                  ),
                ],
              ),
            ),

          ),

      ),
    );
  }

}