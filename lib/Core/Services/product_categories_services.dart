import 'dart:convert';

import 'package:ecom/Model/product_model.dart';
import 'package:http/http.dart' as http;
class ProductCategories{
  Future GategoryProducts(int category_id) async {
    print(category_id);
    print("TTTTTTT");
    final response2 =
    await http.get(
        Uri.parse('https://ecommerce.silohost.xyz/api/products'),
        headers: {'Authorization': "Moroo@!2022!\$"}, );
    final uri = Uri.parse('https://ecommerce.silohost.xyz/api/products').replace(queryParameters: {
      'page': 1,
      'category_id': category_id,
    }.map((key, value) => MapEntry(key, value.toString())),);
    final response = await http.get(uri, headers: {'Authorization': "Moroo@!2022!\$"});
    print(response.statusCode);
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