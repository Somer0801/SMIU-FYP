import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smiu/SplashScreen.dart';
import 'package:smiu/components/colors.dart';

import 'appAssets.dart';

class Customstudent extends StatelessWidget {
  final String name1;
  final String name2;
  final String img;
  const Customstudent({required this.name1,required this.img,required this.name2});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.height*0.16,
        width: Get.width*0.32,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(12)


        ),
        child:Container(
          width: Get.width*0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: Get.height*0.06,
                width: Get.width*0.15,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(image: AssetImage(img),invertColors: true,fit: BoxFit.fill)
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7),
                  child: Column(
                    children: [
                      Text(name1,textAlign:TextAlign.center, style: TextStyle(color:Colors.white,fontSize: 16,fontWeight: FontWeight.w700,letterSpacing: 1.2)),
                      Text(name2,textAlign:TextAlign.center,style: TextStyle(color:Colors.white,fontSize: 16,fontWeight: FontWeight.w700,letterSpacing: 1.2)),
                    ],
                  ))


            ],
          )
        )

    );

  }
}
