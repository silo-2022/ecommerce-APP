import 'package:ecom/Helper/enum.dart';
import 'package:ecom/View/Constant.dart';
import 'package:ecom/View/Widget/custom_text.dart';
import 'package:flutter/material.dart';

class DeliveryTime extends StatefulWidget {
  @override
  State<DeliveryTime> createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {
  Delivery delivery = Delivery.StandardDelivery;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10,),
            RadioListTile<Delivery>(
                value: Delivery.StandardDelivery,
                groupValue:delivery,
                onChanged:(Delivery value) {
                  setState(() {

                    delivery=value;
                  });
                },
              title: CustomText(text: 'Standard Delivery', fontsize: 24,),
              subtitle: CustomText(text: "\nOrder Will Be Delivered Between 3-5 Days",
              fontsize: 18,
              ),
              activeColor: primeryColor,
                  ),
            SizedBox(height: 50,),
            RadioListTile<Delivery>(
              value: Delivery.NextDayDelivery,
              groupValue:delivery,
              onChanged:(Delivery value) {
                setState(() {

                  delivery=value;
                });
              },
              title: CustomText(text: 'Next Day Delivery', fontsize: 24,),
              subtitle: CustomText(text: "\nPlace your order before 6PM and your item will be delivered the next day",
                fontsize: 18,
              ),
              activeColor: primeryColor,
            ),
            SizedBox(height: 50,),
            RadioListTile<Delivery>(
              value: Delivery.NominatedDelivery,
              groupValue:delivery,
              onChanged:(Delivery value) {
                setState(() {

                  delivery=value;
                });
              },
              title: CustomText(text: 'Nominated Day Delivery', fontsize: 24,),
              subtitle: CustomText(text: "\nPick a particular day from calender and order will be delivered on the selected day",
                fontsize: 18,
              ),
              activeColor: primeryColor,
            ),
          ],
        ),
      ),
    );
  }
}
