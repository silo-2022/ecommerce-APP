import 'dart:ui';

import 'package:ecom/Helper/enum.dart';
import 'package:ecom/View/Constant.dart';
import 'package:ecom/View/control_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class checkoutViewModel extends GetxController{
  int get index => _index;
  int _index = 0;
  Pages get pages => _pages;
  Pages _pages = Pages.DeliveryTime;

  void changeIndex(int i){
    _index =i;
    if(_index ==1){
      _pages = Pages.AddAddress;
    }else if(_index ==2){
      _pages = Pages.Summary;
    } else if (_index==3){
      Get.to(ControlView());
    }
    update();

  }
Color getColor (int i)
{
  if(i== index ){
    return inProgressColor;
  } else if (i < index ){
    return Colors.green;
  } else{
    return todoColor;
  }

}}