import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:smiu/adminScreens/admin_dashborad_screen.dart';
import 'package:smiu/components/appAssets.dart';
import 'package:smiu/controllers/meeting_controller.dart';
import 'package:smiu/controllers/progress_controller.dart';
import 'package:smiu/models/meeting_model.dart';
import 'package:smiu/models/progress%20model.dart';
import 'package:smiu/student_screens/student_dashboard.dart';
import 'package:smiu/supervisorScreens/supervisor_dashboard.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../components/colors.dart';
import '../student_screens/student_progress_screen.dart';

class GroupsProgressScreen extends StatefulWidget {
  final String type;
  const GroupsProgressScreen({Key? key,required this.type}) : super(key: key);

  @override
  State<GroupsProgressScreen> createState() => _GroupsProgressScreenState();
}

class _GroupsProgressScreenState extends State<GroupsProgressScreen> {
  progressController controller=Get.put(progressController());


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
                        widget.type=='supervisor'? Get.to(SupervisorDashboardScreen()):Get.to(AdminDashBoardScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Icon(Icons.arrow_back_ios_new,color:AppColors.primaryColor,size: 35,),
                      )),
                ),
              ),
            ),
            SizedBox(height: Get.height*0.03),
            Text("Groups Progress",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,color:AppColors.primaryColor,letterSpacing: 1.2),),
            SizedBox(height: Get.height*0.03),
            Expanded(
                child:  Obx(()=>
                    ListView.builder(
                      // reverse: true,

                        itemCount: controller.studentProgressList.length,
                        itemBuilder: (context,index){
                          progressModel progress = controller.studentProgressList[index];
                          // bool isAttended = meeting.attended ?? true;
                          // print('isAttended: $isAttended');
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
                                  Center(child: Text("${progress.topicName}",style: TextStyle(
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

                                              SfCircularChart(
                                                series: <CircularSeries>[
                                                  PieSeries<ChartData, String>(
                                                    dataSource: [
                                                      ChartData('Progress', (progress.progress ?? 0.0) * 10), // Convert to percentage
                                                      ChartData('Remaining', 100 - ((progress.progress ?? 0.0) * 10)), // Calculate remaining progress
                                                    ],
                                                    xValueMapper: (ChartData data, _) => data.category,
                                                    yValueMapper: (ChartData data, _) => data.value,
                                                    dataLabelMapper: (ChartData data, _) {
                                                      if (data.category == 'Progress') {
                                                        return 'Group Progress ${data.value}%';
                                                      } else {
                                                        return 'Remaining ${data.value}%';
                                                      }
                                                    } ,// Display percentage as label
                                                    dataLabelSettings: DataLabelSettings(
                                                      isVisible: true,
                                                      textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                                                    ),
                                                    // Set colors based on category (Progress/Remaining)
                                                    pointColorMapper: (ChartData data, _) {
                                                      if (data.category == 'Remaining') {
                                                        return Colors.amber; // Color for remaining progress
                                                      } else {
                                                        if (data.value <= 20) {
                                                          return Colors.red;
                                                        } else if (data.value <= 40) {
                                                          return Colors.blue;
                                                        } else if (data.value <= 60) {
                                                          return Colors.purple;
                                                        } else {
                                                          return Colors.green;
                                                        }
                                                      }
                                                    },
                                                  ),
                                                ],
                                              ),

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
                                        color: Colors.blue

                                      ),
                                      child: Center(child: Text( 'Details',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w700),)),
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


