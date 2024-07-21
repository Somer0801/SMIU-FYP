import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smiu/components/appAssets.dart';
import 'package:smiu/components/colors.dart';
import 'package:smiu/components/custom_button.dart';
import 'package:smiu/components/customstudent.dart';
import 'package:smiu/components/dashbardTile.dart';
import 'package:smiu/components/sumssion_fields.dart';
import 'package:smiu/components/supervisor_fields.dart';

import 'package:smiu/components/textfield.dart';
import 'package:smiu/components/textstyle.dart';
import 'package:smiu/dashboard.dart';
import 'package:smiu/student_screens/studentRegistration.dart';
import 'package:smiu/student_screens/student_dashboard.dart';
class SupervisorStatusScreen extends StatefulWidget {
  const SupervisorStatusScreen({Key? key}) : super(key: key);

  @override
  State<SupervisorStatusScreen> createState() => _SupervisorStatusScreenState();
}

class _SupervisorStatusScreenState extends State<SupervisorStatusScreen> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(





        backgroundColor: Colors.white,
        body:Column(
          children: [
            Center(
              child: Container(
                height: Get.height*0.17,
                width: Get.width*1,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(AppAssets.smiulogo),fit: BoxFit.cover)
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                      onTap: (){
                        Get.to(StudentDashboardScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Icon(Icons.arrow_back_ios_new,color:AppColors.primaryColor,size: 35,),
                      )),
                ),
              ),
            ),
            SizedBox(height: Get.height*0.03),
            Text("Supervisor Status",style: TextStyle(fontSize: 28,fontWeight: FontWeight.w700,color:AppColors.primaryColor,letterSpacing: 1.2),),
            SizedBox(height: Get.height*0.2),
            Text("Your Application for supervisor Selection is in pending Kindly wait you group will be assigned to your desire supervisor soon Thank You! ",textAlign: TextAlign.center, style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color:Colors.red,),)






            // CustomButton(text: "Sign In", tap:(){Get.to(DashBoardScreen());} )








      ]
      ),
      )
    );
  }
}
