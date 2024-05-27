import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smiu/components/appAssets.dart';
import 'package:smiu/student_screens/student_dashboard.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../components/colors.dart';

class ProfessorsDetailScreen extends StatefulWidget {
  const ProfessorsDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProfessorsDetailScreen> createState() => _ProfessorsDetailScreenState();
}

class _ProfessorsDetailScreenState extends State<ProfessorsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
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
            Text("Pofessor Details",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,color:AppColors.primaryColor,letterSpacing: 1.2),),
            SizedBox(height: Get.height*0.06),






          ],
        ),
      ),
    );
  }
}

