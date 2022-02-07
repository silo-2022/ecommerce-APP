import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/Core/ViewModel/Auth_View_Model.dart';
import '/Core/ViewModel/Auth_View_Model.dart';
class secondscreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    AuthViewModel viewModel = Get.put(AuthViewModel());
    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[



         Obx(

          () => Text("${viewModel.counter.value}"),

        ),
         RaisedButton(
         child: Text("increment"),

         onPressed: (){
              viewModel.increment();
          })

    ],
      ),
    );
  }

}