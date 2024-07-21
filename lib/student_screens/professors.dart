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
import 'package:smiu/models/supervisor_model.dart';
import 'package:smiu/student_screens/student_dashboard.dart';
import 'package:smiu/supervisorScreens/supervisor_dashboard.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../components/colors.dart';
import '../student_screens/student_progress_screen.dart';

class SupervisorProfileScreen extends StatefulWidget {
  final String role;
  const SupervisorProfileScreen({Key? key,required this.role}) : super(key: key);

  @override
  State<SupervisorProfileScreen> createState() => _SupervisorProfileScreenState();
}

class _SupervisorProfileScreenState extends State<SupervisorProfileScreen> {
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
                        widget.role=='student'? Get.to(StudentDashboardScreen()):Get.to(AdminDashBoardScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Icon(Icons.arrow_back_ios_new,color:AppColors.primaryColor,size: 35,),
                      )),
                ),
              ),
            ),
            SizedBox(height: Get.height*0.03),
            Text("Supervisor Profiles",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,color:AppColors.primaryColor,letterSpacing: 1.2),),
            SizedBox(height: Get.height*0.03),
            Expanded(
                child:  Obx(()=>
                    ListView.builder(
                      // reverse: true,

                        itemCount: controller.professorsProfilesList.length,
                        itemBuilder: (context,index){
                          SupervisorModel professor = controller.professorsProfilesList[index];
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
                                  Center(child: Text("${professor.name}",style: TextStyle(
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

                                             Center(
                                               child: Container(
                                                 height: Get.height*0.2,
                                                 width: Get.width*0.75,
                                                 decoration: BoxDecoration(

                                                   image: DecorationImage(image: NetworkImage(professor.profile.toString()),fit: BoxFit.fill)
                                                 ),
                                               ),
                                             )

                                            ],
                                          ),
                                        )
                                      ],
                                    ),



                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(professor.description.toString()),
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


