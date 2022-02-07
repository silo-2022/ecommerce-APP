import '/Core/ViewModel/HomeViewModel.dart';
import 'package:get/get.dart';
import '/Core/ViewModel/Auth_View_Model.dart';
import '/Core/ViewModel/control_view_model.dart';



class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());

  }

}