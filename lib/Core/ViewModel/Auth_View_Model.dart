
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


 await _auth.signInWithEmailAndPassword(email: email, password: password);
  Get.offAll(HomeView());

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


      Get.offAll(HomeView());

    }catch(e){
      print(e.message);

      Get.snackbar('Error Login account', e.message, colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }




  void SaveUserData(UserCredential user) async{


    await FireStoreUser().addUsertofirestore( UserModel(
      UserID : user.user.uid,
      email : user.user.email,
      name: name,
      pic : "",
    ));
        }

}