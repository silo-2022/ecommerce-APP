import 'dart:developer';

import 'package:ecom/Helper/local_storage_data.dart';
import 'package:ecom/Model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfViewModel extends GetxController{

ValueNotifier<bool> get loading=> _loading;
ValueNotifier<bool> _loading = ValueNotifier(false);
  void onInit(){
    super.onInit();
    getCurrentUser();
  }

  UserModel get userModel => _userModel;
  UserModel _userModel;


  final LocalStorageData localStorageData = Get.find();

  Future<void> signOut() async{
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
}

  void getCurrentUser()async {
_loading.value=true;
    await localStorageData.getUser.then((value)  {
      _userModel = value;
    });
    _loading.value=false;
    update();

  }
}