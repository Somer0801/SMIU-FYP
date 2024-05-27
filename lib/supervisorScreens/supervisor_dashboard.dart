import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smiu/components/appAssets.dart';
import 'package:smiu/components/colors.dart';
import 'package:smiu/components/custom_button.dart';
import 'package:smiu/components/customstudent.dart';
import 'package:smiu/components/dashbardTile.dart';
import 'package:smiu/components/textfield.dart';
import 'package:smiu/components/textstyle.dart';
import 'package:smiu/dashboard.dart';
import 'package:smiu/student_screens/studentRegistration.dart';
import 'package:smiu/student_screens/student_progress_screen.dart';
import 'package:smiu/supervisorScreens/groupProgress.dart';
import 'package:smiu/supervisorScreens/supervsior_login.dart';
class SupervisorDashboardScreen extends StatefulWidget {
  const SupervisorDashboardScreen({Key? key}) : super(key: key);

  @override
  State<SupervisorDashboardScreen> createState() => _SupervisorDashboardScreenState();
}

class _SupervisorDashboardScreenState extends State<SupervisorDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: Align(
          alignment: Alignment.topRight,
          child: Container(
            height: Get.height*0.2,
            width: Get.width*0.35,
            child: Drawer(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    GestureDetector(
                        onTap: (){
                          Get.to(SupervisorLoginScreen());
                        },
                        child: Text("Logout",style: TextStyle(color: Colors.black,),)),
                    Divider(color: Colors.black,thickness: 2,)
                  ],
                ),
              ),

            ),
          ),
        ),

        backgroundColor: Colors.white,
        body:Column(
          children: [
            Stack(



                children: [
                  Container(height: Get.height*0.29,color: Colors.transparent,),
                  Container(
                    height: Get.height*0.25,
                    width: Get.width*1,
                    decoration: BoxDecoration(

                        image: DecorationImage(image: AssetImage(AppAssets.dashboardtop),fit: BoxFit.fill)
                    ),
                    child: Column(
                      children: [

                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(width: Get.width*0.1,),
                              Text("Dashboard",style: TextStyle(fontSize: 28,fontWeight: FontWeight.w700,color: Colors.white,letterSpacing: 1.2),),

                              Builder(
                                builder: (BuildContext context) {
                                  return GestureDetector(
                                    onTap: () {
                                      Scaffold.of(context).openEndDrawer(); // Open the drawer
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: Container(
                                        height: Get.height*0.08,
                                        width: Get.width*0.1,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(image: AssetImage(AppAssets.logout))
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(


                    top: 80,
                    left: 32,
                    right: 32,
                    child: Center(
                      child: Container(
                        height: Get.height*0.18,
                        width: Get.width*0.85,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color:AppColors.tileColor
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              Center(child: Text("Prof Ameen Khowaja",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 18),)),
                              SizedBox(height: Get.height*0.01,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                children: [
                                  SizedBox(height: Get.width*0.1,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [

                                      Center(child: Text("CSC-2OF-173",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 18),)),
                                      SizedBox(height: Get.height*0.015,),

                                      Container(height: Get.height*0.05,width: Get.width*0.3,
                                        decoration: BoxDecoration(
                                            color: AppColors.primaryColor,
                                            borderRadius: BorderRadius.circular(20)
                                        ),
                                        child: Center(child: Text("Edit Pofile",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w700),)),
                                      )
                                    ],

                                  ),


                                  CircleAvatar(
                                    radius: 40,
                                    backgroundImage: AssetImage(AppAssets.studentcircle),
                                  )
                                ],
                              )


                            ],
                          ),
                        ),
                      ),
                    ),
                  )

                ]


            ),
            Container(
              height: Get.height*0.65,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Customstudent(name1: "Profile", img: AppAssets.student,name2: "",),
                      Customstudent(name1: "Groups", img: AppAssets.info,name2: "Info",)

                    ],),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                    GestureDetector(
                      onTap: (){
                        Get.to(GroupsProgressScreen());
                      },
                        child: Customstudent(name1: "Groups", img: AppAssets.progress,name2: "Progress",)),
                    Customstudent(name1: "Submitted", img: AppAssets.files,name2: "Files",)
                  ],),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                    Customstudent(name1: "Meetings", img: AppAssets.meeting,name2: "",),
                    Customstudent(name1: "Gradings", img: AppAssets.grading,name2:"")
                  ],)
                ],
              ),
            )


          ],
        ) ,
      ),
    );
  }
}
