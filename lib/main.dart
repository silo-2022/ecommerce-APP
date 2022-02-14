import 'dart:ffi';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Core/ViewModel/cart_view_model.dart';
import 'Helper/binding.dart';
import 'View/Auth/login_screen.dart';
import 'View/control_view.dart';
Future<void> main()  async {
  WidgetsFlutterBinding.ensureInitialized(


  );
   await Firebase.initializeApp();
  Get.put(CartViewModel());
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetMaterialApp(
      initialBinding: Binding(),
home: Scaffold(

  body: ControlView(),
),
      theme: ThemeData(fontFamily: "SourceSansPro"),
    );
  }
  
}