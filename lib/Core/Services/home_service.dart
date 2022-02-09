import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService{
  final CollectionReference _categoryCollectionref
  = FirebaseFirestore.instance.collection('Categories');

  final CollectionReference _productCollectionref
  = FirebaseFirestore.instance.collection('Products');


Future<List<QueryDocumentSnapshot>> getCategories() async{
  var value = await _categoryCollectionref.get();
  return value.docs;
}

  Future<List<QueryDocumentSnapshot>> BestSellingProducts() async{
    var value = await _productCollectionref.get();
    return value.docs;
  }
}