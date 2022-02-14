import 'package:ecom/Core/ViewModel/cart_view_model.dart';
import 'package:ecom/Core/ViewModel/checkoutview_viewmodel.dart';
import 'package:ecom/Helper/local_storage_data.dart';

import '/Core/ViewModel/Home_View_model.dart';
import 'package:get/get.dart';
import '/Core/ViewModel/Auth_View_Model.dart';
import '/Core/ViewModel/control_view_model.dart';



class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => LocalStorageData());
    Get.lazyPut(() => checkoutViewModel());

  }

}