
import 'package:ecom/Helper/local_storage_data.dart';
import 'package:ecom/View/control_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '/Core/Services/firestore_user.dart';
import '/Model/user_model.dart';
import '/View/home_view.dart';




class AuthViewModel extends GetxController{
  GoogleSignIn _googleSignIn =  GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User> _user = Rxn<User>( );
String get user=> _user.value?.email;

final LocalStorageData localStorageData = Get.find();
String email, password , name ;

 var counter=0.obs;
void increment(){
counter++;
print(counter);

}

@override
void onInit(){
super.onInit();
_user.bindStream(_auth.authStateChanges());
if(_auth.currentUser !=null){
getCurrentUserData(_auth.currentUser.uid);
}
}
@override
  void onReady(){
  super.onReady();
}
void onClose(){
  super.onClose();
}
void goodleSignInMethod() async{
  final GoogleSignInAccount  googleUser = await _googleSignIn.signIn();
  print(googleUser);
  GoogleSignInAuthentication googleSignInAuthentication = await googleUser.authentication;
 final AuthCredential credential =  GoogleAuthProvider.credential(
   idToken: googleSignInAuthentication.idToken,
     accessToken: googleSignInAuthentication.accessToken,
 );
 await _auth.signInWithCredential(credential);
}
void signINwithEmailpass() async {
try{


 await _auth
     .signInWithEmailAndPassword(email: email, password: password)
     .then((value) async {
getCurrentUserData(value.user.uid);


 });
  Get.offAll(ControlView());

}catch(e){
  print(e.message);
  
  Get.snackbar('Error Login account', e.message, colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
}
  }

  void CreatAccwithEmailpass() async {
    try{


      await _auth.createUserWithEmailAndPassword(email: email, password: password).then((user) async{

       SaveUserData(user);

      });


      Get.offAll(ControlView());

    }catch(e){
      print(e.message);

      Get.snackbar('Error Login account', e.message, colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }


Future<void> getCurrentUserData(String uid) async {
  await FireStoreUser().getCurrentUser(uid).then((value) {
    SetUser(UserModel.fromJson(value.data()));
  });
}

  void SaveUserData(UserCredential user) async{
UserModel userModel = UserModel(
  UserID : user.user.uid,
  email : user.user.email,
  name: name,
  pic : "",
);
await FireStoreUser().addUsertofirestore(userModel );
SetUser(userModel);
}



 void SetUser(UserModel userModel)async{
  localStorageData.setUser(userModel);


}

}