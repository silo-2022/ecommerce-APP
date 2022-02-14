import '/Core/Services/database/cart_database_helper.dart';
import '/Model/cart_product_model.dart';
import '/Model/cart_product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController{
  ValueNotifier<bool> get loading =>_loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

List <CartProductModel> _cartProductmodel = [];
List<CartProductModel> get cartProductModel =>_cartProductmodel;
double get totalPrice =>_totalPrice;
double _totalPrice = 0;
var dbHelper = CartDatabaseHelper.db;
CartViewModel(){
  getAllProduct();

}

getAllProduct()async{
  _loading.value= true;

  _cartProductmodel = await dbHelper.getAllProduct();

print(_cartProductmodel.length);
print("hhhhhhhhh");
  _loading.value=false;
  getTotalPrice();
update();
}
addProduct(CartProductModel cartProductModel) async{


    for(int i = 0;i<_cartProductmodel.length; i ++ ) {
      if (_cartProductmodel[i].productID == cartProductModel.productID) {
        return;
      }
    }
      dbHelper = CartDatabaseHelper.db;
      await dbHelper.insert(cartProductModel);
      _cartProductmodel.add(cartProductModel);
    _totalPrice+=(double.parse(cartProductModel.price)*
        cartProductModel.quantity);






  update();

  }

  getTotalPrice(){
  for(int i = 0; i < _cartProductmodel.length; i++){
  _totalPrice+=(double.parse(_cartProductmodel[i].price)*
      _cartProductmodel[i].quantity);

  }
  print(_totalPrice);
  }



  increaseQuantity(int index) async {
  _cartProductmodel[index].quantity++;
  _totalPrice += (double.parse(
      (_cartProductmodel[index].price)));
  await dbHelper.updateProduct(_cartProductmodel[index]);
  update();
  }

  decreaseQuantity(int index) async {

    _cartProductmodel[index].quantity--;
    _totalPrice -= (double.parse(
        (_cartProductmodel[index].price)));
    await dbHelper.updateProduct(_cartProductmodel[index]);
    update();
  }
}