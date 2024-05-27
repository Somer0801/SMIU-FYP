import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smiu/SplashScreen.dart';
import 'package:smiu/adminScreens/admin_login_screen.dart';
import 'package:smiu/components/appAssets.dart';
import 'package:smiu/components/colors.dart';
import 'package:smiu/components/dashbardTile.dart';
import 'package:smiu/student_screens/studentRegistration.dart';
import 'package:smiu/student_screens/studentlogin.dart';
import 'package:smiu/supervisorScreens/supervsior_login.dart';
class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
      height: Get.height*1,
      width: Get.width*1,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: Get.height*0.02,),
          Container(
            height: Get.height*0.16,
            width: Get.width*0.6,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(AppAssets.mainimage),fit: BoxFit.fill)
            ),
          ),
          SizedBox(height: Get.height*0.02,),

          Text("Select User Type",style: TextStyle(color: AppColors.primaryColor,fontSize: 35,fontWeight: FontWeight.w700),),
          Container(
            height: Get.height*0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap:(){
                    Get.to(StudentLoginScreen());
                  },
                    child: CustomDashBoard(name: "Student", img:AppAssets.student )),
                GestureDetector(
                  onTap: (){
                    Get.to(SupervisorLoginScreen());
                  },
                    child: CustomDashBoard(name: "Supervisor", img:AppAssets.supervisor )),
                GestureDetector(
                  onTap: (){
                    Get.to(AdminLoginScreen());
                  },
                    child: CustomDashBoard(name: "Coordinator", img:AppAssets.cordinator ))
              ],
            ),
          )


          
        ],
      ),
      )

    );
  }
}
