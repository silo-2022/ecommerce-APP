import 'package:ecom/Core/ViewModel/Home_View_model.dart';
import 'package:ecom/Core/ViewModel/category_view_model.dart';
import 'package:ecom/Core/ViewModel/category_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get.dart';

import 'Constant.dart';
import 'Widget/custom_text.dart';
import 'detail_view.dart';

class ProductsCategoryView extends  GetView<CategoryViewModel> {
//final String nameCategories;
//final String id;

  //ProductsCategoryView(this.nameCategories, this.id);


  @override
  Widget build(BuildContext context) {
    //controller.passParameters(id, nameCategories)
    print(Get.find<CategoryViewModel>().nameCategories);
    AppBar(
      elevation: 0,
      //backgroundColor: ColorApp.primary,
      iconTheme: IconThemeData(color: Colors.white),
    title: Text("${Get.find<CategoryViewModel>().nameCategories}",),
      actions: [
        IconButton(onPressed: ()=> Get.back(), icon: Icon(Icons.chevron_right_outlined,color: Colors.white,size: 40,))
      ],
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child:_ListViewProductsCategory()
        ),
      )
    );
  }
  Widget _ListViewProductsCategory(){
    return
     /* GetBuilder<CategoryViewModel>(
        init: Get.find(),
      builder: (controller) =>*/
          Container(
padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
        height: 230,
        //color: Colors.pink,
        child: ListView.separated(
            itemCount: controller.productModel.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
              return GestureDetector(
                onTap:(){ Get.to(DetailsView(
                  model: controller.productModel[index],
                ));},
                child: Container(
                  width: MediaQuery.of(context).size.width*.4,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey.shade100
                        ),

                        width: MediaQuery.of(context).size.width*.4,
                        child:
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  width: MediaQuery.of(context).size.width*.4,
                                  height: 100,
                                  child: Image.network("https://ecommerce.silohost.xyz/"+controller.productModel[index].image, fit: BoxFit.fill,)),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: CustomText(text: controller.productModel[index].name, alignment: Alignment.bottomLeft,maxLine: 1,),
                              ),
                              //SizedBox(height: 18),

                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: CustomText(text: controller.productModel[index].description, alignment: Alignment.bottomLeft,color: Colors.grey,),
                              ),
                              //SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: CustomText(text: controller.productModel[index].price+ "KD", alignment: Alignment.bottomLeft,color: primeryColor,),
                              ),
                            ],
                          ),
                        ),),


                    ],
                  ),
                ),
              );

            },
            separatorBuilder: (context, index) => SizedBox(width: 20,)
        ),
    //),
    );
  }
}
