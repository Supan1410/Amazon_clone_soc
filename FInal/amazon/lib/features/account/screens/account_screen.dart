import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/features/account/widgets/below_app_bar.dart';
import 'package:amazon/features/account/widgets/order.dart';
import 'package:amazon/features/account/widgets/top_buttons.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
              ),
            ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(alignment: Alignment.topLeft,
              child:Image.asset(
                'assets/images/amazon_in.png',
                width: 120,
                height: 45,
                color: Colors.black,
              ),),
              Container(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child:const Row(children: [
                  Padding(padding: EdgeInsets.only(right: 15),
                  child: Icon(Icons.notifications_outlined, color: Colors.black, size: 25,),
                  ),
                  Padding(padding: EdgeInsets.only(right: 15),
                  child: Icon(Icons.search, color: Colors.black, size: 25,),
                  ),
                  
                ],)
              )
              
            ]),


          )
          ),
          
      body: Column(
        children: [
          BelowAppBar(),
          SizedBox(height: 10),
          TopButtons(),
          SizedBox(height: 20,),
          Order(),
          
        ],
      ));
    
  }
}
