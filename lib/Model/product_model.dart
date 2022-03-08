import 'dart:ui';

import 'package:ecom/Helper/extension.dart';

class ProductModel{
  int id, category_id;
  String  name, image, description,  price;


  ProductModel({
this.id,
    this.category_id,
    this.name,
    this.image,
    this.description,

    this.price,


});
  ProductModel.fromJson(Map<dynamic, dynamic> map){
    if(map==null){
      return;
    }
    id = map['id'];
    category_id = map['category_id'];
    name = map['name'];
    image = map['photo'];
    description = map['description'];

    price = map['price'];

  }


  toJson(){
    return{
      'id':id,
      'category_id': category_id,
      'name':name,
      'image': image,
      'description':description,

      'price':price,


    };
  }
}