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
import 'package:smiu/controllers/proposal_controller.dart';
import 'package:smiu/dashboard.dart';
import 'package:smiu/local_storage/get_storage.dart';
import 'package:smiu/student_screens/editProfile.dart';
import 'package:smiu/student_screens/professors.dart';
import 'package:smiu/student_screens/proposal%20Submission.dart';
import 'package:smiu/student_screens/studentRegistration.dart';
import 'package:smiu/student_screens/student_meetings_screen.dart';
import 'package:smiu/student_screens/student_progress_screen.dart';
import 'package:smiu/student_screens/studentlogin.dart';
import 'package:smiu/student_screens/supervisor_selection.dart';
class StudentDashboardScreen extends StatefulWidget {
  const StudentDashboardScreen({Key? key}) : super(key: key);

  @override
  State<StudentDashboardScreen> createState() => _StudentDashboardScreenState();
}

class _StudentDashboardScreenState extends State<StudentDashboardScreen> {
  ProposalController controller =Get.put(ProposalController());
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
                        appStorage.erase();
                        Get.to(StudentLoginScreen());
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
                Container(height: Get.height*0.3,color: Colors.transparent,),
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
                          // Padding(
                          //   padding: const EdgeInsets.only(right:5),
                          //   child: Container(
                          //     height: Get.height*0.08,
                          //     width: Get.width*0.1,
                          //     decoration: BoxDecoration(
                          //         shape: BoxShape.circle,
                          //         image: DecorationImage(image: AssetImage(AppAssets.logout))
                          //     ),
                          //   ),
                          // )
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


                  top: 88,
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
                            Center(child: Text("${appStorage.read(studentName)}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 18),)),
                            SizedBox(height: Get.height*0.01,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                              children: [
                                SizedBox(height: Get.width*0.1,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [

                                    Center(child: Text("${appStorage.read(studentId)}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 18),)),
                                    SizedBox(height: Get.height*0.015,),

                                    GestureDetector(
                                      onTap: (){
                                        Get.to(StudentProfileScreen());
                                      },
                                      child: Container(height: Get.height*0.05,width: Get.width*0.3,
                                        decoration: BoxDecoration(
                                            color: AppColors.primaryColor,
                                            borderRadius: BorderRadius.circular(20)
                                        ),
                                        child: Center(child: Text("Edit Pofile",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w700),)),
                                      ),
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

                    GestureDetector(
                      onTap:(){
                        Get.to(SupervisorProfileScreen(role: 'student',));
                      },
                        child: Customstudent(name1: "Supervisors profiles", img: AppAssets.student,name2: "",)),
                    GestureDetector(
                      onTap: (){
                        controller.teamCheck();

                      },
                        child: Customstudent(name1: "Supervisor", img: AppAssets.teacher,name2: "Selection",))

                  ],),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                    GestureDetector(
                      onTap:(){Get.to(ProposalSubmission());},
                        child: Customstudent(name1: "Proposal", img: AppAssets.proposal,name2: "Submission",)),
                    GestureDetector(
                      onTap: (){
                        Get.to(StudentProgressScreen());
                      },
                        child: Customstudent(name1: "Progress", img: AppAssets.progress,name2: "",))
                  ],),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                    GestureDetector(
                      onTap:(){
                        Get.to(StudentMeetingScreen());
                      },
                        child: Customstudent(name1: "Meetings", img: AppAssets.meeting,name2: "",)),
                    Customstudent(name1: "Submission", img: AppAssets.submission,name2:"")
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
