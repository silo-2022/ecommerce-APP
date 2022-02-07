import 'package:ecom/View/Prof_View.dart';
import 'package:ecom/View/cart_view.dart';
import 'package:ecom/View/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  Widget _CurrentScreen = HomeView();
  get CurrentScreen => _CurrentScreen;

  int _navigatorvalue = 0;

get navigatorvalue => _navigatorvalue;
  void changeSelectedValue(selectedValue) {
    _navigatorvalue = selectedValue;

    switch (selectedValue){
      case 0 :{
        _CurrentScreen = HomeView();
        break;
      }
      case 1 : {
        _CurrentScreen =CartView();
        break;
      }
      case 2 : {
        _CurrentScreen =ProfileView();
        break;
      }


    }
      update();
  }
}