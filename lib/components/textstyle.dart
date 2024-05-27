import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smiu/SplashScreen.dart';
import 'package:smiu/components/colors.dart';

class TextStyling extends StatelessWidget {
  final String text;


  const TextStyling({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,style: TextStyle(fontSize:30,color:AppColors.primaryColor,fontWeight: FontWeight.w800,letterSpacing: 1.25),
    );
  }
}
