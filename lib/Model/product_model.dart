import 'dart:ui';

import 'package:ecom/Helper/extension.dart';

class ProductModel{
  String productID , name, image, description, sized, price;
       Color color;
  ProductModel({

    this.name,
    this.image,
    this.description,
    this.color,
    this.sized,
    this.price,
    this.productID,

});
  ProductModel.fromJson(Map<dynamic, dynamic> map){
    if(map==null){
      return;
    }
    name = map['name'];
    image = map['image'];
    description = map['description'];
    color = HexColor.fromHex( map['color']);
    sized = map['sized'];
    price = map['price'];
    productID = map['productID'];
  }


  toJson(){
    return{
      'name':name,
      'image': image,
      'description':description,
      'color':color,
      'sized':sized,
      'price':price,
      'productID':productID,

    };
  }
}