import 'package:ecom/Core/Services/product_categories_services.dart';
import 'package:ecom/Model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CategoryViewModel extends GetxController{


  String nameCategories = Get.parameters["name"];
  String idCategories;

void passParameters(String id, String name){
  nameCategories=name;
  idCategories=id;

}

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    //print(Get.parameters["id"]);
    print("+/+/+?+?+?");
    getCategoryProducts(category_id:int.parse(idCategories));

   print(Get.parameters["id"]);
    update();
  }

  List<ProductModel> get productModel => _productModel ;
  List<ProductModel> _productModel = [];
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  getCategoryProducts( {int category_id}) async {

    ProductCategories().GategoryProducts(category_id).then((value){

      loading.value=false;
      _productModel = value;
      print(_productModel);
      print("gggggggg");


      loading.value=true;
      update();

    });
  }
}