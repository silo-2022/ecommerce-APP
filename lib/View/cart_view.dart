import 'package:ecom/Core/ViewModel/cart_view_model.dart';
import 'package:ecom/View/checkout/checkoutview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/View/Constant.dart';
import 'package:ecom/View/Widget/Custom_button.dart';
import 'package:ecom/View/Widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return GetBuilder<CartViewModel>(
        init: Get.find(),
    builder:(controller) =>Scaffold(

      body: controller.cartProductModel.length ==0
          ?Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/cartempty.svg', width: 200, height: 200,),
          SizedBox(height: 20,),
          CustomText(text: "Cart Empty",fontsize: 32,alignment: Alignment.center,)
        ],
      ):Column(
        children: [
          Expanded(
            child:

                  Container(
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
                                    GestureDetector(

                                        child: Icon(Icons.add, color: Colors.black,),
                                    onTap:(){ controller.increaseQuantity(index);},
                                    
                                    ),
                                    SizedBox(width: 10,),
                                    CustomText(text: controller.cartProductModel[index].quantity.toString(),alignment: Alignment.center,fontsize:20 ,color: Colors.black,),
                                    Container(
                                     padding: EdgeInsets.only(bottom: 20),
                                        child: GestureDetector(
                                          
                                            child: Icon(Icons.minimize, color: Colors.black,),
                                        
                                        onTap: (){controller.decreaseQuantity(index);},
                                        )),
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
                    GetBuilder<CartViewModel>(
                      init: Get.find(),
                        builder: (controller)=>
                            CustomText(text: '\$ ${controller.totalPrice}',color: primeryColor,fontsize: 18,))
                  ],
                ),

                Container(
                  padding: EdgeInsets.all(20),
                    height: 100,
                    width: 180,
                    child: CustomButton(onPressed: (){
                      Get.to(CheckOutView());
                    },text: 'Checkout',))
              ],
            ),
          )
        ],
      ),
    ),
    );
  }
  
}