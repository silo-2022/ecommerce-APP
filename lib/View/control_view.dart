import '../Core/ViewModel/control_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../Core/ViewModel/Auth_View_Model.dart';
import '../View/Auth/login_screen.dart';

import 'Auth/login_screen.dart';


class ControlView extends GetWidget<AuthViewModel>{

  @override
  Widget build(BuildContext context) {
   return Obx((){
     return (Get.find<AuthViewModel>().user == null)
         ? LoginScreen()
         : GetBuilder<ControlViewModel>(
       init: ControlViewModel(),
            builder: (controller)=>
         Scaffold(body: controller.CurrentScreen,
             bottomNavigationBar: bottomNavigationBar(),



     ),
     );
   });
  }
  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
init: Get.find(),
      builder: (controller)=>
          BottomNavigationBar(
            items:[
              BottomNavigationBarItem(
                  label: '',
                  activeIcon:
                  Padding(padding: EdgeInsets.only(top: 10)
                      ,child: Text("Explore")) ,
                  icon: Image.asset("assets/explore.png", fit: BoxFit.contain,width: 20,)


              ),
              BottomNavigationBarItem(

                  activeIcon:Padding(padding: EdgeInsets.only(top: 10)
                      ,child: Text("Basket")) ,

                  label: '',
                  icon: Image.asset("assets/basket.png", fit: BoxFit.contain,width: 20,)


              ),
              BottomNavigationBarItem(
                  activeIcon: Padding(padding: EdgeInsets.only(top: 10)
                      ,child: Text("Profile")) ,
                  label: "",
                  icon: Image.asset("assets/prof.png", fit: BoxFit.contain,width: 20,)


              ),
            ],

            currentIndex: controller.navigatorvalue,
            onTap: (index) {

              controller.changeSelectedValue(index);


            },
            elevation: 0,

            selectedItemColor: Colors.black,
            backgroundColor: Colors.grey.shade50,
          ),
    );


  }
}