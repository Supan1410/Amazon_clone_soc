import "package:amazon/constants/global_variables.dart";
import "package:amazon/features/account/widgets/single_product.dart";
import "package:flutter/material.dart";

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => OrderState();
}

class OrderState extends State<Order> {

  List list=[
   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFYqoKTu_o3Zns2yExbst2Co84Gpc2Q1RJbA&s',
   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFYqoKTu_o3Zns2yExbst2Co84Gpc2Q1RJbA&s',
   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFYqoKTu_o3Zns2yExbst2Co84Gpc2Q1RJbA&s'
 ];


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: const Text(
                "Your Orders",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 15),
              child: Text(
                "See all",
                style: TextStyle(
                  color: GlobalVariables.selectedNavBarColor,

                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        Container(
          height: 170,
          padding: EdgeInsets.only(left: 10,top:20,right: 0,),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: ((context,index){
              return SingleProduct(image: list[index]);


          }),),
        )
      ],
    );
  }
}
