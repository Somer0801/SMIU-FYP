import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smiu/adminScreens/admin_dashborad_screen.dart';
import 'package:smiu/components/appAssets.dart';
import 'package:smiu/components/colors.dart';
import 'package:smiu/dashboard.dart';
import 'package:smiu/local_storage/get_storage.dart';
import 'package:smiu/student_screens/student_dashboard.dart';
import 'package:smiu/supervisorScreens/supervisor_dashboard.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4), () {
     checkUser();

    });

  }
  checkUser(){
    if(appStorage.read(studentToken)!=null){
      Get.offAll(StudentDashboardScreen());
    }
    else if(appStorage.read(professorToken)!=null){
      Get.offAll(SupervisorDashboardScreen() );
    }
    else if(appStorage.read(adminToken)!=null){
      Get.offAll(AdminDashBoardScreen());
    }
    else{
      Get.offAll(DashBoardScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Center(
              child: Container(
                height: Get.height*0.3,
                width: Get.width*0.9,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(AppAssets.mainimage),fit:BoxFit.fill )
                ),
              ),


            ),
            CircularProgressIndicator(color: AppColors.primaryColor,)
          ],
        ),
      ),
    );
  }
}
