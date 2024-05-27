import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:smiu/components/appAssets.dart';
import 'package:smiu/controllers/meeting_controller.dart';
import 'package:smiu/models/meeting_model.dart';
import 'package:smiu/student_screens/student_dashboard.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../components/colors.dart';

class StudentMeetingScreen extends StatefulWidget {
  const StudentMeetingScreen({Key? key}) : super(key: key);

  @override
  State<StudentMeetingScreen> createState() => _StudentMeetingScreenState();
}

class _StudentMeetingScreenState extends State<StudentMeetingScreen> {
  MeetingController controller=Get.put(MeetingController());

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
            Text("Meetings",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,color:AppColors.primaryColor,letterSpacing: 1.2),),
            SizedBox(height: Get.height*0.03),
            Expanded(
              child:  Obx(()=>
                ListView.builder(
                  // reverse: true,

                  itemCount: controller.studentmeetingList.length,
                    itemBuilder: (context,index){
                      meetingModel meeting = controller.studentmeetingList[index];
                      bool isAttended = meeting.attended ?? true;
                      print('isAttended: $isAttended');
                      return   Padding(
                        padding: EdgeInsets.only(bottom: 5,top: 5),
                        child: Container(
                        margin: EdgeInsets.only(right: 10,left: 10),
                        // height: Get.height*0.12,
                        width: Get.width*0.9,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5), // Shadow color
                              spreadRadius: 5, // Spread radius
                              blurRadius: 7, // Blur radius
                              offset: Offset(0, 3), // Offset from the top-left corner
                            ),
                          ],

                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: Get.height*0.01,),
                            Center(child: Text("Meeting ${meeting.meeting_num}",style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w700
                            ),)),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Wrap(
                                      children: [
                                        Text(
                                          "${meeting.professorName} scheduled a meeting on ${meeting.meetingdate}",
                                          softWrap: true,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),

                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: Get.height*0.05,
                                width: Get.width*0.3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: isAttended ? Colors.blue : Colors.red,

                                ),
                                child: Center(child: Text( isAttended ? 'Attended' : 'Not Attended',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w700),)),
                              ),
                            )


                          ],),
                                            ),
                      );
                    }
                ),

            )

            )










    ],
        ),
      ),
    );
  }
}


