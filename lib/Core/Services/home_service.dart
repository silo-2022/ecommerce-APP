import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService{
  final CollectionReference _categoryCollectionref
  = FirebaseFirestore.instance.collection('Categories');
Future<List<QueryDocumentSnapshot>> getCategories() async{
  var value = await _categoryCollectionref.get();
  return value.docs;
}
}