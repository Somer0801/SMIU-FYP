import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smiu/SplashScreen.dart';
import 'package:smiu/components/colors.dart';

import 'appAssets.dart';

class CustomDashBoard extends StatelessWidget {
  final String name;
  final String img;
  const CustomDashBoard({required this.name,required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height*0.2,
      width: Get.width*0.4,
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12)


      ),
      child:Container(
        width: Get.width*0.5,
        child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: Get.height*0.1,
            width: Get.width*0.3,
            decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(image: AssetImage(img),invertColors: true)
            ),
          ),
          Text(name,style: TextStyle(color:Colors.white,fontSize: 23,fontWeight: FontWeight.w700,letterSpacing: 1.2))


        ],
      ) ,
      )

    );

  }
}
