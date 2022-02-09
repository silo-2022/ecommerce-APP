import 'package:ecom/Model/product_model.dart';
import 'package:ecom/View/Widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailView extends StatelessWidget{
  ProductModel model;
  DetailView({
    this.model
});
  @override
  Widget build(BuildContext context) {

return Scaffold(
  body: SingleChildScrollView(child:
    Container(child:
      Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
              height: 270,
              child: Image.network(model.image, fit: BoxFit.fill)),
          SizedBox( height: 15),
          Container(
            
            padding: EdgeInsets.all(18),
            child: CustomText(
              text: model.name,
              fontsize: 26,
            ),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width*.45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.grey
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomText(
                      text: 'Size',

                    ),
                    CustomText(
                      text: model.sized,

                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width*.45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: Colors.grey
                    )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomText(
                      text: 'Color',

                    ),
                    CustomText(
                      text: model.color,

                    ),
                  ],
                ),
              ),
            ],
          )

        ],
      ),),),
);
  }
  
}