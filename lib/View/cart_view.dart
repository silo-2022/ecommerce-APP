import 'package:ecom/Core/ViewModel/cart_view_model.dart';
import 'package:ecom/View/Constant.dart';
import 'package:ecom/View/Widget/Custom_button.dart';
import 'package:ecom/View/Widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(

      body: Column(
        children: [
          Expanded(
            child: GetBuilder<CartViewModel>(
              init: CartViewModel(),
              builder:(controller) =>Container(
                child: ListView.separated(itemBuilder: (context, index){
                  return Container(
                    height: 140,
                    child:  Row(
                      children: [
                      Container(
                          width: 140,

                          child: Image.network(controller.cartProductModel[index].image, fit: BoxFit.fill,)),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(text: controller.cartProductModel[index].name,fontsize: 24,),
                              SizedBox(height: 10),
                              CustomText(text: '\$ ${controller.cartProductModel[index].price}',
                              color: primeryColor,),
                              SizedBox(height: 20),
                              Container(
                                width: 140,
                                color: Colors.grey.shade200,
                                height: 40,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.add, color: Colors.black,),
                                    SizedBox(width: 10,),
                                    CustomText(text: '1',alignment: Alignment.center,fontsize:20 ,color: Colors.black,),
                                    Container(
                                     padding: EdgeInsets.only(bottom: 20),
                                        child: Icon(Icons.minimize, color: Colors.black,)),
                                    SizedBox(width: 10,),

                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                        //CustomText(text: names[index],fontsize: 40,),
                      ],
                    ),
                  );
                },itemCount:controller.cartProductModel.length , separatorBuilder: (BuildContext context, int index){
                  return SizedBox(height: 10,);
                },)

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CustomText(
                      text: 'TOTAL',fontsize: 22,color: Colors.grey,
                    ),
                    SizedBox(height: 15,),
                    CustomText(text: '\$ 200',color: primeryColor,fontsize: 18,)
                  ],
                ),

                Container(
                  padding: EdgeInsets.all(20),
                    height: 100,
                    width: 180,
                    child: CustomButton(onPressed: (){},text: 'Checkout',))
              ],
            ),
          )
        ],
      ),

    );
  }
  
}