import 'dart:ui';

import 'package:ecom/Helper/extension.dart';

class CartProductModel{
  String productID, name, image,  price;
  int quantity;

  CartProductModel({
    this.name,
    this.image,

    this.price,
    this.quantity,
    this.productID

  });
  CartProductModel.fromJson(Map<dynamic, dynamic> map){
    if(map==null){
      return;
    }
    name = map['name'];
    image = map['image'];
    price = map['price'];
    quantity = map['quantity'];
    productID = map['productID'];

  }


  toJson(){
    return{
      'name':name,
      'image': image,
      'price':price,
      'quantity':quantity,
      'productID': productID


    };
  }
}