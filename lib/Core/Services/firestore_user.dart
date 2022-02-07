import 'package:cloud_firestore/cloud_firestore.dart';
import '/Model/user_model.dart';

class FireStoreUser{
  final CollectionReference _usercollectionRef =   FirebaseFirestore.instance.collection('Users');

  Future <void> addUsertofirestore(UserModel UserModel) async{
             await _usercollectionRef.doc(UserModel.UserID).set(UserModel.toJson());
  }
}