import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smiu/SplashScreen.dart';
import 'package:smiu/components/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? tap;
  const CustomButton({required this.text,this.tap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        height: Get.height*0.068,
        width: Get.width*0.85,

        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(child: Text(text,style: TextStyle(color:Colors.white,fontWeight:FontWeight.w500,fontSize: 30,letterSpacing: 1.2),)),
      ),
    );
  }
}

