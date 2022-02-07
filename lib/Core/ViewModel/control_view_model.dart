import '/View/Prof_View.dart';
import '/View/cart_view.dart';
import '/View/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ControlViewModel extends GetxController {
  Widget _CurrentScreen = HomeView();
  get CurrentScreen => _CurrentScreen;

  int _navigatorvalue = 0;

get navigatorvalue => _navigatorvalue;
  void changeSelectedValue(selectedValue) {
    _navigatorvalue = selectedValue;
print(selectedValue);
    switch (selectedValue){
      case 0 :{
        print(_CurrentScreen);
        _CurrentScreen = HomeView();
        print(_CurrentScreen);
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