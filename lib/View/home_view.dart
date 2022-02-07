
import 'package:ecom/Core/ViewModel/HomeViewModel.dart';
import '/Core/ViewModel/HomeViewModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Core/ViewModel/control_view_model.dart';
import '../View/Auth/login_screen.dart';
import '../View/Constant.dart';
import '../View/Prof_View.dart';
import '../View/Widget/custom_text.dart';


class HomeView extends StatelessWidget{
final List<String> names =<String>[ "s", "s","s","s","s"];
  @override
  Widget build(BuildContext context){
    return GetBuilder<HomeViewModel>(
     builder: (controller)=> Scaffold(
        body: Container(

          padding: EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Column(
            children: [
              _searchTextFormField(),
              SizedBox(height: 30,),
              CustomText(text: "Categories",),
              SizedBox(height: 30,),
              _ListViewCategory(),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children:

                  [
                    CustomText(text: "Best Selling", fontsize: 18,),
                    SizedBox(height: 10,),
                    CustomText(text: "See All", fontsize: 16,),
                  ]
              ),
             // SizedBox(height: 50,),
              SizedBox(height: 18,),
              _ListViewProduct(),
            ],
          ),
        ),



      ),
    );

  }
 Widget _searchTextFormField(){
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.shade200
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: Colors.black,),
        ),


      ),
    );

 }
 Widget _ListViewCategory(){
    return  GetBuilder<HomeViewModel>(
      builder:(controller)=> Container(

        height: 90,
        child: ListView.separated(
            itemCount: controller.categoryModel.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.shade100
                    ),
                    height: 60,
                    width: 70,
                    child:  Padding(
                        padding: const EdgeInsets.all(8),

                        child: Image.network(controller.categoryModel[index].image)),),
                  SizedBox(height: 10,),
                  CustomText(text: controller.categoryModel[index].name,)
                ],
              );

            },
            separatorBuilder: (context, index) => SizedBox(width: 20,)
        ),
      ),
    );
 }
 Widget _ListViewProduct(){
   return  Container(

     height: 230,
     //color: Colors.pink,
     child: ListView.separated(
         itemCount: names.length,
         scrollDirection: Axis.horizontal,
         itemBuilder: (context, index){
           return Container(
             width: MediaQuery.of(context).size.width*.4,
             child: Column(
               children: [
                 Container(
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(50),
                       color: Colors.grey.shade100
                   ),

                   width: MediaQuery.of(context).size.width*.4,
                   child:
                   Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Container(
                             width: MediaQuery.of(context).size.width*.4,
                             height: 100,
                             child: Image.asset("assets/3.png", fit: BoxFit.fill,)),
                         Padding(
                           padding: const EdgeInsets.only(left: 8.0),
                           child: CustomText(text: "Watch", alignment: Alignment.bottomLeft,),
                         ),
                        SizedBox(height: 18),

                         Padding(
                           padding: const EdgeInsets.only(left: 8.0),
                           child: CustomText(text: "Watch", alignment: Alignment.bottomLeft,color: Colors.grey,),
                         ),
                         SizedBox(height: 10),
                         Padding(
                           padding: const EdgeInsets.only(left: 8.0),
                           child: CustomText(text: "25 K.D", alignment: Alignment.bottomLeft,color: primeryColor,),
                         ),
                       ],
                     ),
                   ),),


               ],
             ),
           );

         },
         separatorBuilder: (context, index) => SizedBox(width: 20,)
     ),
   );
 }


}