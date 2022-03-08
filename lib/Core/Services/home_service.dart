import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom/Model/category_model.dart';
import 'package:ecom/Model/product_model.dart';
import 'package:http/http.dart' as http;
class HomeService {
  final CollectionReference _categoryCollectionref
  = FirebaseFirestore.instance.collection('Categories');

  final CollectionReference _productCollectionref
  = FirebaseFirestore.instance.collection('Products');
  List<CategoryModel> categories = [];

  Future<List<CategoryModel>> getCategories() async {
    final response =
    await http.get(
        Uri.parse('https://ecommerce.silohost.xyz/api/categories/main'),
        headers: {'Authorization': "Moroo@!2022!\$"}, );

    // print(response.statusCode);
    if (response.statusCode == 200) {
      try {
        final body = json.decode(utf8.decode(response.bodyBytes));
        return body
            .map<CategoryModel>((json) => CategoryModel.fromJson(json))
            .toList();
      } catch (e) {
        print('Error: $e');
        return null;
      }
    } else {
      print("Error retrieving categories");
      print(response.body);
      return null;
    }
  }

    //var value = await _categoryCollectionref.get();
    //return value.docs;


  Future BestSellingProducts() async {
      final response =
      await http.get(
          Uri.parse('https://ecommerce.silohost.xyz/api/products'),
          headers: {'Authorization': "Moroo@!2022!\$"});

      // print(response.statusCode);
      if (response.statusCode == 200) {
        try {
          final body = json.decode(utf8.decode(response.bodyBytes));
          print(body);
          return body['data']
              .map<ProductModel>((json) => ProductModel.fromJson(json))
              .toList();
        } catch (e) {
          print('Error: $e');
          return null;
        }
      } else {
        print("Error retrieving categories");
        print(response.body);
        return null;
      }
    }
  }
