
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:smiu/adminScreens/admin_dashborad_screen.dart';
import 'package:smiu/controllers/request_controller.dart';
import 'package:smiu/student_screens/student_dashboard.dart';

import '../components/appAssets.dart';
import '../components/colors.dart';
import '../controllers/profileController.dart';

class ChangeSupervisorRequestScreen extends StatefulWidget {
  const ChangeSupervisorRequestScreen({Key? key}) : super(key: key);

  @override
  State<ChangeSupervisorRequestScreen> createState() => _ChangeSupervisorRequestScreenState();
}

class _ChangeSupervisorRequestScreenState extends State<ChangeSupervisorRequestScreen> {
  fypRequestController controller=Get.put(fypRequestController());

  @override
  void initState() {
    print('Admin Requests');


    controller.adminSuperRequest();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        Get.to(AdminDashBoardScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Icon(Icons.arrow_back_ios_new,color:AppColors.primaryColor,size: 35,),
                      )),
                ),
              ),
            ),
            SizedBox(height: Get.height*0.03),
            Text("Change Supervisor Requests",textAlign: TextAlign.center, style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,color:AppColors.primaryColor,letterSpacing: 1.2),),
            Expanded(
              child: Obx(
                    () => controller.isgetting.value
                    ? Center(
                  child: SizedBox(
                    width: Get.width * 0.1,
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  ),
                )
                    : ListView.builder(
                  itemCount: controller.adminSuprequestList.length,
              itemBuilder: (context, index) {
              final request = controller.adminSuprequestList[index];
              
              
              
              
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
                                  Center(child: Text("${request.team!.name}",style: TextStyle(
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
                                                  height: Get.height*0.15,
                                                  width: Get.width*0.32,
                                                  decoration: BoxDecoration(
              
                                                      image: DecorationImage(image: AssetImage(AppAssets.profile),fit: BoxFit.fill)
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
                                    child: Text('A Group having team id ${request.team!.name.toString()} want to change their supervisor and they want their new supervisor ${request.supervisor!.name.toString()} having id ${request.supervisor!.universityId.toString()} with the reason ${request.reason.toString()}',style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500
                                    ),),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [


                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                          onTap: () async {
                                            await controller.adminRequestAcceptDecline(request.id.toString(), "0");
                                            controller.adminSuprequestList.removeAt(index);
                                          },
                                          child: Container(
                                            height: Get.height*0.05,
                                            width: Get.width*0.3,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: AppColors.errorcolor

                                            ),
                                            child: Center(child: Text( 'Decline',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w700),)),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                          onTap: ()async{
                                            await controller.adminRequestAcceptDecline(request.id.toString(), "1");
                                            controller.adminSuprequestList.removeAt(index);

                                          },
                                          child: Container(
                                            height: Get.height*0.05,
                                            width: Get.width*0.3,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: Colors.blue
                                          
                                            ),
                                            child: Center(child: Text( 'Approve',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w700),)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
              
              
                                ],),
                            ),
                          );
                        }
                    ),
              
              ),
            ),



          ],
        ),
      ),
    );
  }
}

// ListView.builder(
// itemCount: controller.adminSuprequestList.length,
// itemBuilder: (context, index) {
// final request = controller.adminSuprequestList[index];
// return Padding(
// padding: const EdgeInsets.all(10),
// child: Container(
// width: Get.width * 0.95,
// color: Colors.grey,
// child: Row(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// CircleAvatar(
// radius: 40,
// backgroundImage: AssetImage(AppAssets.profile),
// ),
// SizedBox(width: 10),
// Expanded(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// 'A Group having team id ${request.teamId.toString()} want to change their supervisor and they want their new supervisor ${request.supervisor!.name.toString()} having id ${request.supervisor!.universityId.toString()} with the reason ${request.reason.toString()}',
// style: TextStyle(
// fontSize: 14,
// color: Colors.black,
// ),
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// );
// },
// ),
//

