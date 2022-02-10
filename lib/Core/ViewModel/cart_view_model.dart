import 'package:ecom/Core/Services/database/cart_database_helper.dart';
import 'package:ecom/Model/cart_product_model.dart';
import 'package:ecom/Model/cart_product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController{
  ValueNotifier<bool> get loading =>_loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

List <CartProductModel> _cartProductmodel = [];
List<CartProductModel> get cartProductModel =>_cartProductmodel;

CartViewModel(){
  getAllProduct();
}
getAllProduct()async{
  _loading.value= true;
var dbHelper = CartDatabaseHelper.db;
await dbHelper.getAllProduct();

print(_cartProductmodel.length);
print("hhhhhhhhh");
  _loading.value=false;
update();
}
  addProduct(CartProductModel cartProductModel) async{
    var dbHelper = CartDatabaseHelper.db;
    await dbHelper.insert(cartProductModel);
    update();

  }
}