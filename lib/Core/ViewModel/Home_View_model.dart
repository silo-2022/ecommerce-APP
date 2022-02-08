import 'package:ecom/View/Prof_View.dart';
import 'package:ecom/View/cart_view.dart';
import 'package:ecom/View/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '/Model/category_model.dart';
import 'package:get/get.dart';
class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
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
  List<CategoryModel> get categoryModel => _categoryModel;
  List<CategoryModel> _categoryModel = [];
  final CollectionReference _categoryCollectionref
  = FirebaseFirestore.instance.collection('Categories');

  HomeViewModel(){
    getCategory();
  }
  getCategory() async{
    _loading.value=true;
    await _categoryCollectionref.get().then((value){
      for(int i =0; i<value.docs.length; i++){
        _categoryModel.add(CategoryModel.fromJson(value.docs[i].data()));
        print(_categoryModel.length);
        print(_categoryModel[i].name);
        print(_categoryModel[i].image);
        _loading.value=false;
      }
      update();
    });
  }
}